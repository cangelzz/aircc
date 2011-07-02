package com.airsmth.defines {
	import flash.events.*;
	import flash.net.*;
    import mx.collections.ArrayCollection;
    import com.airsmth.defines.*

	public class FavorLoader extends TextLoader {
        
		public function FavorLoader():void {
            super(SMTH.ATOMIC);
		}
        
		override protected function onLoad(event:Event):void {
            var content:String = _loader.content;
            var p:RegExp = new RegExp("act=board&board=(\\w+)", "g");
            var result:Object = p.exec(content);
            _data = new ArrayCollection();
            var board:Board;
            while (result != null) {
                board = new Board();
                board.bname = result[1];
                board.ftype = "6";
                board.page = 0;
                _data.addItem(board);
                result = p.exec(content);
            }
            dispatchEvent(new LoadEvent(LoadEvent.DONE));
		}
	}
}
