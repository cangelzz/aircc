package com.airsmth.defines {
	import flash.events.*;
	import flash.net.*;
	import mx.collections.*;

	import spark.components.List;
    
    import com.airsmth.defines.*

	public class PostLoader {

		private var _text:String;
		private var _list:List;
		private var _id:Number;
        private var _loader:Loader;
        private var _po:Post;
		public function PostLoader(po:Post,li:List,id:Number):void {
			_list = li;
			_id = id;
            _po = po;
			loadPost();
		}
		
		private function loadPost():void {
            _loader = new Loader(SMTH.BBSCON, _po.data);
            _loader.addEventListener(LoadEvent.LOADED, onPostLoad);
            _loader.load();
		}
		
		private function onPostLoad(event:Event):void {
			_text = _loader.content;
			//var p:RegExp = new RegExp("prints\\(.(.*).\\);o.h", "g");
            var p:RegExp = new RegExp("站内(.*)--", "g");
			var content:String;
            var reply:String;
			var result:Object = p.exec(_text);
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

			var po:Post = _list.dataProvider.getItemAt(_id) as Post;
			po.content = content;
            po.reply = reply;
			_list.dataProvider.setItemAt(po, _id);
			
			
		}
	}
}
