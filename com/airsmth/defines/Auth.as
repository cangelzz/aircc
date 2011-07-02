package com.airsmth.defines {
    import flash.net.*;
    
	public class Auth {
        private var _id:String;
        private var _passwd:String;
        
        public function Auth(id:String, passwd:String):void {
            _id = id;
            _passwd = passwd
        }
        
        public function get data():URLVariables {
            var _data:URLVariables = new URLVariables();
            _data.id = _id;
            _data.passwd = _passwd;
            _data.kick_multi = 1;
            return _data;
        }
        
        public function get id():String {
            return _id;
        }
    }
}