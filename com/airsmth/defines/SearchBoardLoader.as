package com.airsmth.defines {
    import flash.events.*;
    import flash.net.*;
    import mx.collections.ArrayCollection;
    import com.airsmth.defines.*;
    
    public class SearchBoardLoader extends TextLoader {
        public var board:Board;
        
        public function SearchBoardLoader(searchText:String):void {
            super(SMTH.BBSSEL, "board=" + UrlMultiEncode.urlencodeGB2312(searchText));
            _data = new ArrayCollection();
        }
        
        override protected function onLoad(e:Event):void {
            var content:String = _loader.content;
            //ta.r('<a href="bbsdoc.php?board=BM_Apply">BM_Apply</a>','版主申请'
            var p:RegExp = new RegExp("ta.r.*?>(.*?)<\\/a>','(.*?)'", "g");
            var result:Object = p.exec(content);
            var board:Board;
            //var lines:ArrayCollection = new ArrayCollection();
            while (result != null) {
                board = new Board();
                board.bname = result[1];
                board.cname = result[2];
                _data.addItem(board);
                result = p.exec(content);
            }
            if (_data.length == 0) _data.addItem("No board is found");
        	//_data = lines;
            dispatchEvent(new LoadEvent(LoadEvent.DONE));
        } //end onSubjectLoad
        
        override protected function onStatus(e:Event):void {
            var code:Number = _loader.statusevent.status;
            if (code == 302) {
                var url:String = _loader.statusevent.responseURL;
                var bname:String = url.substr(url.indexOf("board=") + 6);
                board = new Board;
                board.bname = bname;
                _data.addItem(board);
                dispatchEvent(new LoadEvent(LoadEvent.REDIRBOARD));
            }
        }
    }
}