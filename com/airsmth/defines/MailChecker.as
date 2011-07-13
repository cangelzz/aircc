package com.airsmth.defines {
	import flash.events.*;
	import flash.net.*;
    import com.airsmth.defines.*

	public class MailChecker extends TextLoader {
        public var newmailcnt:String = "0";
        public var isNewMail:Boolean = false;
        
		public function MailChecker():void {
            super(SMTH.ATOMIC);
		}
		
		override protected function onLoad(event:Event):void {
            var content:String = _loader.content;
            if (content.indexOf("登录") != -1) {
                dispatchEvent(new LoadEvent(LoadEvent.RELOGIN));
                return;
            }
            var p:RegExp = /新信:\s(\d+)\s封/;
            var result:Object = p.exec(content);
            if (result != null) {
                newmailcnt = result[1];
                if (newmailcnt != "0") isNewMail = true;
                dispatchEvent(new LoadEvent(LoadEvent.DONE));
            }
            else dispatchEvent(new LoadEvent(LoadEvent.LOADFAIL));
		}
	}
}
