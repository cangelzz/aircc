package com.airsmth.defines {
	import flash.events.*;
    import flash.net.*;
    import com.airsmth.defines.*;
    
    public class ReplyPostLoader {
        private var _reply:Reply;
        private var _loader:Loader;
    
        public function ReplyPostLoader(reply:Reply):void {
            _reply = reply;
            postReply();
        }
        
        private function postReply():void {
            _loader = new Loader(_reply.url, _reply.data, "POST");
            _loader.addEventListener(LoadEvent.LOADED, onReplyPost);
            _loader.load();
        }
        
        private function onReplyPost(event:Event):void {
            var _text:String = _loader.content;
            
        }
    }
}