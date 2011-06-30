package com.airsmth.defines {
    import flash.events.*;
    import flash.net.*;
    import mx.collections.*;
    import spark.components.List;
    import spark.components.Button;
    import com.airsmth.defines.*;
    
    public class BoardLoader {
        private var _board:Board;
        private var _list:List;
        private var _loader:Loader;
        private var _prevBtn:Button = null;
        private var _nextBtn:Button = null;
        
        
        public function BoardLoader(board:Board, grid:List, prevBtn:Button = null, nextBtn:Button = null):void {
            _board = board;
            _list = grid;
            _prevBtn = prevBtn;
            _nextBtn = nextBtn;
            loadBoard();
        }
        
        private function loadBoard():void {
            _loader = new Loader(SMTH.BBSDOC, _board.data);
            _loader.addEventListener(LoadEvent.LOADED, onBoardLoad);
            _loader.load();
        }
        
        private function onBoardLoad(event:Event):void {
             var text:String = _loader.content;
             var p:RegExp = new RegExp("c\\.o\\((\\d+),(\\d+),'(.*?)','(.*?)',(\\d+),'(.*?)',(\\d+),\\d+,\\d+\\)", "ig");
             var p2:RegExp = new RegExp("docWriter\\('(.*?)',(\\d+),(\\d+),(\\d+),(\\d+),(\\d+),(\\d+)"); 
             //board, bid, start, man, ftype, page, total
             var result2:Object = p2.exec(text);
             var result:Object = p.exec(text);
             
             _board.page = Number(result2[6]);
             _board.start = Number(result2[3]);
             _board.total = Number(result2[7]);
             
             if ((_prevBtn != null) && (_nextBtn != null)) {
                if (_board.start <= _board.total - 30) _nextBtn.enabled = true;
                else _nextBtn.enabled = false;
             }
             
             var lines:ArrayCollection = new ArrayCollection();
             
             while (result != null) {
                 var thread:Subject = new Subject();
                 thread.bname = result2[1];
                 thread.bid = result2[2];
                 thread.pid = result[1];
                 thread.gid = result[2];
                 thread.author = result[3];
                 thread.flag = result[4];
                 thread.time = result[5];
                 thread.title = result[6];
                 thread.size = result[7];
                 lines.addItem(thread);
                 result = p.exec(text);
             }
             _list.dataProvider = lines;
        }
    }
}