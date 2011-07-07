package com.airsmth.defines {
    import flash.events.*;
    import flash.net.*;
    import mx.collections.ArrayCollection;
    import com.airsmth.defines.*;
    
    public class BoardLoader extends TextLoader {
        private var _board:Board;
        private var latest:Boolean = true;
        private var bottom:Boolean = false;
        
        public function BoardLoader(board:Board, config:Config = null):void {
            super(SMTH.BBSDOC, board.data);
            _board = board;
            if (config != null) {
                latest = config.showlatest;
                bottom = config.showbottom;
            }
        }
        
        public function get board():Board {
            return _board;
        }
        
        override protected function onLoad(event:Event):void {
             var text:String = _loader.content;
             var p:RegExp = new RegExp("c\\.o\\((\\d+),(\\d+),'(.*?)','(.*?)',(\\d+),'(.*?)',(\\d+),\\d+,\\d+\\)", "ig");
             var p2:RegExp = new RegExp("docWriter\\('(.*?)',(\\d+),(\\d+),(\\d+),(\\d+),(\\d+),(\\d+)"); 
             //board, bid, start, man, ftype, page, total
             var result2:Object = p2.exec(text);
             var result:Object = p.exec(text);
             
             _board.page = Number(result2[6]);
             _board.start = Number(result2[3]);
             _board.total = Number(result2[7]);
             
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
                 // ignore Bottom post
                 
                 if (!thread.d || (thread.d && bottom)) lines.addItem(thread);
                 result = p.exec(text);
             }
             
             if (latest) lines.source.reverse();
             
             _data = lines;
             dispatchEvent(new LoadEvent(LoadEvent.DONE));
        }
    }
}