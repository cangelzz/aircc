package com.airsmth.defines {
	import flash.events.*;
	import flash.net.*;
	import mx.collections.*;

	import spark.components.List;
	import mx.controls.Alert;
    
    import com.airsmth.defines.*

	public class PostLoader {

		private var _text:String;
		private var _grid:List;
		private var _id:Number;
        private var _loader:Loader;
        private var _po:Post;
		public function PostLoader(po:Post,li:List,id:Number):void {
			_grid = li;
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
			var result:Object = p.exec(_text);
			if (result == null)
				content = "error";
			else
				content = StringHelper.trim(result[1].replace(/\\n/ig, "\n"), "\n");
//			dispatchEvent(new postEvent(postEvent.LOADED));
			var po:Post = _grid.dataProvider.getItemAt(_id) as Post;
			po.content = content;
			_grid.dataProvider.setItemAt(po, _id);
			
			
		}
	}
}
