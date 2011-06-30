package com.airsmth.defines {
    import flash.net.*;
    
    [Bindable]
    public class Reply {
        public var title:String;
        public var content:String;
        public var signature:String = "0";
        public var mailback:String = "0";
        public var havemath:String = "0";
        public var id:String;
        public var bname:String;
        
        public function Reply(t:String, c:String):void {
            title = t;
            content = c;
        }
        public function get data():URLVariables {
            var _data:URLVariables = new URLVariables();
            _data.title = title;
            _data.text = content;
            _data.signature = signature;
            _data.mailback = mailback;
            _data.havemath = havemath;
            return _data;
        }
        
    }
}