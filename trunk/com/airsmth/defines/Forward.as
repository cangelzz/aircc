package com.airsmth.defines {
    import flash.net.*;
    import com.airsmth.defines.StringHelper;
    import com.airsmth.defines.UrlMultiEncode;
    
    [Bindable]
    public class Forward {
        public var id:String;
        public var title:String;
        public var author:String;
        public var board:String;
        public var target:String;
        public var big5:String = "0";
        public var noansi:String = "1";
        
        public function Forward(post:Post = null):void {
            if (post != null) {
                title = post.title;
                author = post.author;
                board = post.bname;
                id = post.id;
            }
        }
        
        public function get data():URLVariables {
            var _data:URLVariables = new URLVariables;
            _data.board = board;
            _data.id = id;
            _data.target = target;
            _data.noansi = noansi;
            _data.big5 = big5;
            return _data;
        }
    }
}