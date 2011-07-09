package com.airsmth.defines {
	import flash.events.*;
	import flash.net.*;
    import mx.collections.ArrayCollection;
    import com.airsmth.defines.*

	public class FavorLoader extends TextLoader {
        
		public function FavorLoader(para:String = null):void {
            super(SMTH.BBSFAV, para);
		}
        
		override protected function onLoad(event:Event):void {
            var content:String = _loader.content;
            //o.o(false,1,1091,190337,'[代理]','ADAgent_HGDG','合购代购'
            var p:RegExp = new RegExp("o.o\\(\\w+,\\d,(\\d+),\\d+,'.*?','(.*?)','(.*?)'", "g");
            var result:Object = p.exec(content);
            _data = new ArrayCollection();
            var board:Board;
            while (result != null) {
                board = new Board();
                board.bid = result[1];
                board.bname = result[2];
                board.cname = result[3];
                board.ftype = "6";
                board.page = 0;
                _data.addItem(board);
                result = p.exec(content);
            }
            dispatchEvent(new LoadEvent(LoadEvent.DONE));
		}
	}
}
