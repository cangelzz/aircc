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
        
        public static const DIR:String = ".DIR";
        public static const SENT:String = ".SENT";
        public static const DELETED:String = ".DELETED";
    }
}