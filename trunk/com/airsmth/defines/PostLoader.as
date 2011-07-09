package com.airsmth.defines {
	import flash.events.*;
	import flash.net.*;
    import mx.collections.ArrayList;
	import mx.collections.ArrayCollection;
    import com.airsmth.defines.*

	public class PostLoader extends TextLoader {
		private var _idx:Number;
        private var _post:Post;
        
		public function PostLoader(post:Post, idx:Number, config:Object = null, newdata:URLVariables = null):void {
            var buf:Object;
            if (newdata != null) buf = newdata;
            else buf = post.data;
            super(SMTH.BBSCON, buf);
            _post = post;
            _idx = idx;
            if (config != null) {
                if (config is Config) _post.showrefer = config.showrefer;
                if (config is Boolean) _post.showrefer = config;
            }
		}
        
        public function get post():Post {
            return _post;
        }
		
		public function get idx():Number {
            return _idx;
        }
		override protected function onLoad(event:Event):void {
			var _text:String = _loader.content;
            var longauthor:String = _text.substring(_text.indexOf("发信人:")+5, _text.indexOf("信区:")-2);
            _post.author = longauthor.substring(0, longauthor.indexOf(" "));
            var p:RegExp = new RegExp("站内(.*)--", "g");
            //                                            bname    bid    id     gid      rid        title
            var pt:RegExp = new RegExp("conWriter\\(\\d,\\s'(\\w+)',\\s(\\d+),\\s(\\d+),\\s(\\d+),\\s(\\d+),.*'(.*?)'");
			var content:String;
            var reply:String;
            var bname:String = "";
			var result:Object = p.exec(_text);
            var result2:Object = pt.exec(_text);
            if (result2 != null) {
                _post.bname = result2[1];
                _post.bid = result2[2];
                _post.id = result2[3];
                _post.gid = result2[4];
                _post.rid = result2[5];
                _post.title = result2[6];
            }
                
			if (result == null)
				content = "error";
			else {
				content = StringHelper.trim(result[1].replace(/\\n/ig, "\n"), "\n");
                content = content.replace(/\\\//ig, "\/");
                content = content.replace(/\n\n/g, "\n");
                var idx:Number = content.indexOf("【");
                if (idx != -1) {
                    reply = content.substr(idx);
                    content = content.substr(0, idx);
                    var p2:RegExp = new RegExp("【 在\\s(.*?)\\s.*?】", "g");
                    reply.replace(p2, "[$2]");
                    
                }
            }
			_post.content = content;
            _post.reply = reply;
            
            var pa:RegExp = new RegExp("attach\\('(.*?)',\\s(\\d+),\\s(\\d+)\\);", "g");
            var att:Object = pa.exec(_text);
            var urls:ArrayList = new ArrayList();
            var pf:RegExp = /(jpg|png|jpeg|gif)/i;
            while (att != null) {
                var fname:String = att[1];
                var ext:String = fname.substr(fname.lastIndexOf("."));
                if (pf.test(fname)) {
                    urls.addItem("http://att.newsmth.net/att.php?p."+_post.bid+"."+_post.id+"."+att[3] +ext);
                }
                att = pa.exec(_text);
            }
            if (urls.length > 0) _post.images = urls;
			dispatchEvent(new LoadEvent(LoadEvent.DONE));
		}
	}
}
