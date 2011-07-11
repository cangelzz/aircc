package com.airsmth.defines {
    import flash.events.*;
    import flash.net.*;
    import mx.collections.ArrayCollection;
    import com.airsmth.defines.*;
    
    public class SearchPostLoader extends TextLoader {
        private var _option:SearchOption;
        
        public function SearchPostLoader(op:SearchOption):void {
            super(SMTH.BBSFIND, op.data);
            _option = op;
        }
        
        public function get option():SearchOption {
            return _option;
        }
        
        override protected function onLoad(e:Event):void {
        	var _text:String = _loader.content;
            var p:RegExp = /userid=(\w+).*?bid=(\d+)&id=(\d+)/g;
            var result:Object = p.exec(_text);
            var post:Post;
            while (result != null) {
                if (_data == null) _data = new ArrayCollection();
                post = new Post();
                post.bname = _option.board;
                post.author = result[1];
                post.bid = result[2];
                post.id = result[3];
                _data.addItem(post);
                result = p.exec(_text);
            }
            dispatchEvent(new LoadEvent(LoadEvent.DONE));
			
        }
    }
}