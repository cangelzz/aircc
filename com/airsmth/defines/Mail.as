﻿package com.airsmth.defines {
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
        public var realauthor:String = null;
        
        private var p_n:RegExp = /n/i;
        private var p_r:RegExp = /r/i;

        
        public function get data():URLVariables {
            var _data:URLVariables = new URLVariables();
            _data.dir = path;
            _data.num = id;
            return _data;
            
        }
        
        public function createReply():Mail {
            var m:Mail = new Mail();
            m.path = path;
            m.author = author;
            m.fileno = fileno;
            m.title = title;
            return m;
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
        
        public function get deldata():URLVariables {
            var _data:URLVariables = new URLVariables();
            _data.act = "del";
            _data.dir = path;
            _data.file = fileno;
            return _data;
        }
        
        public function get r():Boolean {
            return p_r.test(flag);
        }
        public function get n():Boolean {
            return p_n.test(flag);
        }
    }
}