package com.airsmth.defines {
    import flash.events.*;
    import flash.net.*;
    import mx.collections.*;
    import com.airsmth.defines.*;
    
    public class TextSender extends EventDispatcher {
        protected var _sender:Sender;
        
        public function TextSender(url:String, data:String):void {
            _sender = new Sender(url, data);
        }
        
        public function send():void {
            _sender.addEventListener(LoadEvent.LOADED, onSend);
            _sender.send();
        }
        
        protected function onSend(event:Event):void {
        }
    }
}