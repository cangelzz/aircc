﻿package com.airsmth.defines {
    import flash.net.*;
    
    [Bindable]
    public class Post {
        public var bname:String = null;
    	public var bid:String = null;
    	public var id:String = null;
    	public var author:String = null;
    	public var content:String = "";
        public var reply:String = "";
        public var title:String = "";
        

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