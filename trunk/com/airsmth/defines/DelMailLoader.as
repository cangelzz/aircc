package com.airsmth.defines {
    import flash.events.*;
    import flash.net.*;
    import mx.collections.ArrayCollection;
    import com.airsmth.defines.*;
    
    public class DelMailLoader extends TextLoader {
        private var _mail:Mail;
        
        public function DelMailLoader(mail:Mail):void {
            super(SMTH.ACTMAIL, mail.deldata, "gb2312", false);
            _mail = mail;
        }
        
        override protected function onLoad(e:Event):void {
        } //end onSubjectLoad
        
        override protected function onStatus(e:Event):void {
            var code:Number = _loader.statusevent.status;
            if (code == 302) {
                dispatchEvent(new LoadEvent(LoadEvent.DONE));
            }
        }
    }
}