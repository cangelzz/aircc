package com.airsmth.defines {
	import flash.events.*;
	import flash.net.*;
	import mx.collections.ArrayCollection;
    import com.airsmth.defines.*

	public class MailLoader extends TextLoader {
        private var _mail:Mail;
        
		public function MailLoader(mail:Mail):void {
            super(SMTH.MAILCON, mail.data);
            _mail = mail;
		}
        
        public function get mail():Mail {
            return _mail;
        }

		override protected function onLoad(event:Event):void {
			var _text:String = _loader.content;
            var p:RegExp = new RegExp("寄信人:\\s(.*?)\\\\n.*?\\\\n\\\\n(.*).\\)");
            var result:Object = p.exec(_text);
            var p2:RegExp = new RegExp("userid=(\\w+)");
            var result2:Object = p2.exec(_text);
            _mail.author = result2[1];
            //_mail.author = result[1];
            _mail.content = result[2].replace(/\\\//ig, "\/").replace(/\\n/g, "\n");;
			dispatchEvent(new LoadEvent(LoadEvent.DONE));
		}
	}
}
