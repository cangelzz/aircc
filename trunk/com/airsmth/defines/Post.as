package com.airsmth.defines {
    import flash.net.*;
    import mx.collections.ArrayList;
    
    [Bindable]
    public class Post {
        public var bname:String = null;
    	public var bid:String = null;
    	public var id:String = null;
    	public var author:String = null;
    	public var content:String = "";
        public var reply:String = "";
        public var title:String = "";
        public var lz:String = "";
        public var images:ArrayList = null;
        public var showreply:Boolean = false;

        public function get data():URLVariables {
            var _data:URLVariables = new URLVariables();
            _data.bid = bid;
            _data.id = id;
            return _data;
        }
        
        public function get replydata():URLVariables {
            var _data:URLVariables = new URLVariables();
            _data.board = bname;
            _data.reid = id;
            return _data;
        }
    }
}