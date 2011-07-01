package com.airsmth.defines {
    import flash.net.*;
    import com.airsmth.defines.StringHelper;
    import com.airsmth.defines.UrlMultiEncode;
    
    [Bindable]
    public class Reply {
        public var title:String;
        public var content:String;
        public var signature:String = "0";
        public var mailback:String = "0";
        public var havemath:String = "0";
        public var id:String;
        public var bname:String;
        
        public function get data():String {
            return "signature=" + signature + "&title=" + UrlMultiEncode.urlencodeGB2312(title) +
                 "&text=" + UrlMultiEncode.urlencodeGB2312(content.replace(/\r/g,"\r\n"));
        }
        
        public function get url():String {
            return SMTH.BBSSND + "?board=" + bname + "&reid=" + id;
        }
    }
}