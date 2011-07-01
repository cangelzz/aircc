package com.airsmth.defines {
	import flash.events.*;
    import flash.net.*;
    import com.airsmth.defines.*;
    
    public class ReplyPostLoader {
        private var _reply:Reply;
        private var _sender:Sender;
    
        public function ReplyPostLoader(reply:Reply):void {
            _reply = reply;
            postReply();
        }
        
        private function postReply():void {
            _sender = new Sender(_reply.url, _reply.data);
            _sender.addEventListener(LoadEvent.LOADED, onReplyPost);
            _sender.load();
        }
        
        private function onReplyPost(event:Event):void {
            var _text:String = _sender.content;
            
        }
    }
}