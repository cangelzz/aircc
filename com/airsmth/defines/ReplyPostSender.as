package com.airsmth.defines {
	import flash.events.*;
    import flash.net.*;
    import com.airsmth.defines.*;
    
    public class ReplyPostSender extends TextSender {
        private var _reply:Reply;

        public function ReplyPostSender(reply:Reply):void {
            super(reply.url, reply.data);
            _reply = reply;
        }
        
        override protected function onSend(event:Event):void {
            var _text:String = _sender.content;
            if (_text.indexOf("操作成功") != -1) dispatchEvent(new LoadEvent(LoadEvent.DONE));
        }
    }
}