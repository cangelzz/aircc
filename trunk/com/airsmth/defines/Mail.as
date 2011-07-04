package com.airsmth.defines {
    import flash.net.*;
    
    [Bindable]
    public class Mail {
        public var id:String = "";
        public var flag:String;
        public var author:String;
        public var title:String;
        public var content:String;
        public var time:String;
        public var size:String;
        public var fileno:String = "";
        public var path:String = "";
        public var backup:String = "1";
        public var signature:String = "0";
        
        public function get data():URLVariables {
            var _data:URLVariables = new URLVariables();
            _data.dir = path;
            _data.num = id;
            return _data;
            
        }
        
        public function get replydata():URLVariables {
            var _data:URLVariables = new URLVariables();
            _data.dir = path;
            _data.userid = author;
            _data.file = fileno;
            return _data;
        }
        
        public function get postdata():String {
            return "title=" + UrlMultiEncode.urlencodeGB2312(title) + "&userid=" + author +
                "&num=" + id + "&dir=" + path + "&file=" + fileno + "&signature=" + signature + "&backup=" + "1"
                + "&text=" + UrlMultiEncode.urlencodeGB2312(content.replace(/\r/g,"\r\n"));
        }
    }
}