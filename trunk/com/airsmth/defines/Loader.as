package com.airsmth.defines {
    import flash.net.*;
    import flash.events.*;
    import com.airsmth.defines.LoadEvent;
    
    public class Loader extends EventDispatcher {
        private var _stream:URLStream = null;
        private var _request:URLRequest = null;
        private var _url:String = "";
        private var _content:String = "";
        private var _data:URLVariables = null;
        private var _method:String = "GET";
        
        public function Loader(url:String, data:URLVariables = null, method:String = "GET"):void {
            _url = url;
            _data = data;
            _method = method;
            _request = new URLRequest(_url);
            _request.method = _method;
        }

        public function get content():String {
            return _content;
        }
        
        public function load():void {
            _request.data = _data;
            _stream = new URLStream();
            _stream.load(_request);
            _stream.addEventListener(Event.COMPLETE, onLoad);
            
        }
        
        private function onLoad(event:Event):void {
            _content = _stream.readMultiByte(_stream.bytesAvailable, "gb2312");
            dispatchEvent(new LoadEvent(LoadEvent.LOADED));
            //_function();
        }
    }
}