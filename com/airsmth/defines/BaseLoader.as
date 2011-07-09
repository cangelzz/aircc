package com.airsmth.defines {
    import flash.net.*;
    import flash.events.*;
    import com.airsmth.defines.LoadEvent;
    
    public class BaseLoader extends EventDispatcher {
        private var _stream:URLStream = null;
        private var _request:URLRequest = null;
        private var _url:String = "";
        private var _content:String = "";
        private var _data:Object = null;
        public var encoding:String = "gb2312";
        public var statusevent:HTTPStatusEvent;
        
        public function BaseLoader(url:String, data:Object = null, method:String = URLRequestMethod.GET, follow:Boolean = true):void {
            _url = url;
            _data = data;
            _request = new URLRequest(_url);
            _request.method = method;
            _request.data = _data;
            _request.useCache = false;
            _request.followRedirects = follow;
        }

        public function get content():String {
            return _content;
        }
        
        public function load():void {
            _stream = new URLStream();
            _stream.addEventListener(Event.COMPLETE, onLoad);
            _stream.addEventListener(HTTPStatusEvent.HTTP_RESPONSE_STATUS, onStatus);
            _stream.load(_request);
        }
        
        protected function onLoad(event:Event):void {
            _content = _stream.readMultiByte(_stream.bytesAvailable, encoding);
            dispatchEvent(new LoadEvent(LoadEvent.LOADED));
        }
        
        protected function onStatus(event:HTTPStatusEvent):void {
            statusevent = event;
            dispatchEvent(new LoadEvent(LoadEvent.STATUS));
        }
    }
}