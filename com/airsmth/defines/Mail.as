package com.airsmth.defines {
    import flash.net.*;
    
    [Bindable]
    public class Mail {
        public var id:String;
        public var flag:String;
        public var author:String;
        public var title:String;
        public var content:String;
        public var time:String;
        public var size:String;
        public var fileno:String;
        public var path:String;
        
        public function get data():URLVariables {
            var _data:URLVariables = new URLVariables();
            _data.dir = path;
            _data.num = id;
            return _data;
            
        }
    }
}