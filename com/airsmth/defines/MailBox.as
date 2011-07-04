package com.airsmth.defines {
    import flash.net.*;
    
    [Bindable]
    public class MailBox {
        public var path:String = ".DIR";
        public var start:String = null;
        public static const DIR:String = ".DIR";
        public static const SENT:String = ".SENT";
        public static const DELETED:String = ".DELETED";
        public function MailBox(p:String = ".DIR", st:String = null):void {
            path = p;
            start = st;
        }
        public function get data():URLVariables {
            var _data:URLVariables = new URLVariables();
            _data.path = path;
            if (start != null) _data.start = start;
            return _data;
        }
    }
}