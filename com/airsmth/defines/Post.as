package com.airsmth.defines {
    import flash.net.*;
    
    [Bindable]
    public class Post {
    	public var bid:String = null;
    	public var id:String = null;
    	public var author:String = " ";
    	public var content:String = " ";

        public function get data():URLVariables {
            var _data:URLVariables = new URLVariables();
            _data.bid = bid;
            _data.id = id;
            return _data;
        }
    }
}