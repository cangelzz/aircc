package com.airsmth.defines {
	import flash.events.*;
	import flash.net.*;
    import mx.collections.ArrayList;
	import mx.collections.ArrayCollection;
    import com.airsmth.defines.*

	public class GroupPostLoader extends TextLoader {
		private var _idx:Number;
        private var _post:Post;
        
		public function GroupPostLoader(post:Post, idx:Number= 0, config:Object = null, newdata:URLVariables = null):void {
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
            //var longauthor:String = _text.substring(_text.indexOf("发信人:")+5, _text.indexOf("信区:")-2);
            //_post.author = longauthor.substring(0, longauthor.indexOf(" "));
            var p:RegExp = new RegExp("站内(.*)(--|※)", "i");
            var result:Object = p.exec(_text);
            var post:Post;
            _data = new ArrayCollection();
            if (result == null) {
                post = new Post();
                post.author = "ERROR";
                post.content = "ERROR";
                //_data.addItem(post);
            }
            var posts:Array = result[1].split(/☆─────────────────────────────────────☆/);
            var content:String;
            var p2:RegExp = new RegExp(".*?\\s(\\w+)\\s.*?提到:(.*)");
            var result2:Object;
            
            for (var i:Number = 1; i < posts.length; i++) {
                result2 = p2.exec(posts[i]);
                if (result2 == null) continue;
                post = new Post();
                post.author = result2[1];
                content = StringHelper.trim(result2[2].replace(/\\n/ig, "\n"), "\n").replace(/\\\//ig, "\/").replace(/\n\n/g, "\n");
                var idx:Number = content.indexOf("【");
                if (idx != -1) {
                    var reply:String = content.substr(idx);
                    content = content.substr(0, idx);
                    var p3:RegExp = new RegExp("【 在\\s(.*?)\\s.*?】", "g");
                    reply.replace(p3, "[$2]");
                post.reply = reply;
                post.content = content;
                _data.addItem(post);
                }
            }
            
			dispatchEvent(new LoadEvent(LoadEvent.DONE));
		}
	}
}
