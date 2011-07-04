package com.airsmth.defines {
	import flash.events.*;
    import flash.net.*;
    import com.airsmth.defines.*;
    
    public class MailSender extends TextSender {
        private var _mail:Mail;

        public function MailSender(mail:Mail):void {
            super(SMTH.SENDMAIL, mail.postdata);
            _mail = mail;
        }
        
        override protected function onLoad(event:Event):void {
            var _text:String = _loader.content;
            if (_text.indexOf("操作成功") != -1) dispatchEvent(new LoadEvent(LoadEvent.DONE));
        }
    }
}