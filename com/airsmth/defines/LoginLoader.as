package com.airsmth.defines {
	import flash.events.*;
	import flash.net.*;
    import com.airsmth.defines.*

	public class LoginLoader extends TextLoader {
		private var _auth:Auth;
        public var isLoggedIn:Boolean = false;
        
		public function LoginLoader(auth:Auth):void {
            super(SMTH.LOGINURL, auth.data, URLRequestMethod.POST);
            _auth = auth;
		}
        
        public function get auth():Auth {
            return _auth;
        }
		
		override protected function onLoad(event:Event):void {
            var content:String = _loader.content;
            if (content.indexOf("location.href") != -1) {
                isLoggedIn = true;
			    dispatchEvent(new LoadEvent(LoadEvent.LOGINSUCC));
            }
            else {
                isLoggedIn = false;
                dispatchEvent(new LoadEvent(LoadEvent.LOGINFAIL));
            }
		}
	}
}
