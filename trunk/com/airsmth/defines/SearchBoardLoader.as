package com.airsmth.defines {
    import flash.events.*;
    import flash.net.*;
    import mx.collections.ArrayCollection;
    import com.airsmth.defines.*;
    
    public class SearchBoardLoader extends TextLoader {
        private var _sub:Subject;
        
        public function SearchBoardLoader(searchText:String):void {
            super(SMTH.BBSSEL, "board=" + UrlMultiEncode.urlencodeGB2312(searchText));
        }
        
        override protected function onLoad(e:Event):void {
            var content:String = _loader.content;
            //ta.r('<a href="bbsdoc.php?board=BM_Apply">BM_Apply</a>','版主申请'
            var p:RegExp = new RegExp("ta.r.*?>(.*?)<\\/a>','(.*?)'", "g");
            var result:Object = p.exec(content);
            var board:Board;
            var lines:ArrayCollection = new ArrayCollection();
            while (result != null) {
                board = new Board();
                board.bname = result[1];
                board.cname = result[2];
                lines.addItem(board);
                result = p.exec(content);
            }
        	_data = lines;
            dispatchEvent(new LoadEvent(LoadEvent.DONE));
			
        } //end onSubjectLoad
    }
}