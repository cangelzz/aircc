package com.airsmth.defines {
    import flash.net.*;
    import flash.events.*;
    import com.airsmth.defines.LoadEvent;
    
    public class Sender extends EventDispatcher {
        private var _stream:URLStream = null;
        private var _request:URLRequest = null;
        private var _url:String = "";
        private var _content:String = "";
        
        public function Sender(url:String, data:String):void {
            _url = url;
            _request = new URLRequest(_url);
            _request.method = URLRequestMethod.POST;
            _request.data = data;
            _request.useCache = false;
        }

        public function get content():String {
            return _content;
        }
        
        public function load():void {
            _stream = new URLStream();
            _stream.load(_request);
            _stream.addEventListener(Event.COMPLETE, onLoad);
            
        }
        
        private function onLoad(event:Event):void {
            _content = _stream.readMultiByte(_stream.bytesAvailable, "gb2312");
            dispatchEvent(new LoadEvent(LoadEvent.LOADED));
        }
    }
}