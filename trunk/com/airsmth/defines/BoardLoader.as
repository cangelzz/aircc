﻿package com.airsmth.defines {
    import flash.events.*;
    import flash.net.*;
    import mx.collections.*;
    import spark.components.List;
    import com.airsmth.defines.*;
    
    public class BoardLoader {
        private var _board:Board;
        private var _list:List;
        private var _loader:Loader;
        
        
        public function BoardLoader(board:Board, grid:List):void {
            _board = board;
            _list = grid;
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
             var p2:RegExp = new RegExp("docWriter\\('(.*?)',(\\d+)");
             var result:Object = p.exec(text);
             var result2:Object = p2.exec(text);
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