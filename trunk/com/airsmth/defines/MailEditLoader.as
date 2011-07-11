package com.airsmth.defines {
    import flash.events.*;
    import flash.net.*;
    import com.airsmth.defines.*;
    
    public class MailEditLoader extends TextLoader {
        private var _mail:Mail;
        
        public function MailEditLoader(mail:Mail, newdata:URLVariables = null):void {
            var data:Object;
            if (newdata == null) data = mail.replydata;
            else data = newdata;
            super(SMTH.PSTMAIL, data);
            _mail = mail;
        }
        
        public function get mail():Mail {
            return _mail;
        }
        
        override protected function onLoad(event:Event):void {
            var _text:String = _loader.content;
            var p:RegExp = new RegExp("name=.userid.\\s+value=.(\\w+).");
            var result:Object = p.exec(_text);
            _mail.author = result[1];
            
            if (_mail.title == "" || _mail.title == null) {
                var pt:RegExp = /name="title".*?value="(.*?)"/;
                var resultt:Object = pt.exec(_text);
                _mail.title = resultt[1];
            } else {
                if (_mail.title.substr(0, 3) != "Re:") _mail.title = "Re: " + _mail.title;
            }
            
            _mail.content = _text.substring(_text.indexOf("physical")+10 , _text.indexOf("textarea>") -2);
            dispatchEvent(new LoadEvent(LoadEvent.DONE));
        }
    }
}