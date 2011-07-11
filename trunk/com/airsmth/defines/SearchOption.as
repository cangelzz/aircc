package com.airsmth.defines {
    import flash.net.*;
    
    [Bindable]
    public class SearchOption {
        public var q:String = "1";
        public var board:String;
        public var title:String;
        public var userid:String;
        public var dt:String = "7";
        
        public function get data():String {
            return "q=" + q + "&board=" + board + "&title=" + UrlMultiEncode.urlencodeGB2312(title) +
                 "&userid=" + userid + "&dt=" + dt;
        }
    }
}