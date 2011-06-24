package com.airsmth.defines {
	import flash.events.*;
	import flash.net.*;
	import mx.collections.*;
	
	import com.airsmth.defines.Post;
    import com.airsmth.defines.Loader;
	import spark.components.DataGrid;
	import mx.controls.Alert;
    import com.airsmth.defines.StringHelper;
	public class PostLoader2 {

		private var _urlStream:URLStream;
		private var _text:String;
		private var _grid:DataGrid;
		private var _id:Number;
        private var _loader:Loader;
		public function PostLoader2(po:Post,li:DataGrid,id:Number):void {
			_grid = li;
			_id = id;
			loadPost(po);
		}
		
		private function loadPost(po:Post):void {
            _loader = new Loader(po.url(), onPostLoad);
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
		public function get getText():String {
			return _text;
		}
	}
}
