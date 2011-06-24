package com.airsmth.defines {
    import flash.net.*;
    import flash.events.*;
    //import com.airsmth.defines.LoadEvent;
    
    public class Loader extends EventDispatcher {
        private var _stream:URLStream = null;
        private var _request:URLRequest = null;
        private var _url:String = "";
        public var content:String = "";
        private var _function:Function = null;
        public var data:URLVariables = null;
        private var _method:String = "GET";
        
        public function Loader(url:String, func:Function):void {
            _url = url;
            _function = func;
            _request = new URLRequest(_url);
        }
        
        public function load():void {
            if (data != null) _request.method = URLRequestMethod.POST;
            else _request.method = URLRequestMethod.GET;
            _stream = new URLStream;
            _stream.load(_request);
            _stream.addEventListener(Event.COMPLETE, onLoaded);
            
        }
        
        
        private function onLoaded(event:Event):void {
            content = _stream.readMultiByte(_stream.bytesAvailable, "gb2312");
            //dispatchEvent(new LoadEvent(LoadEvent.LOADED));
            _function();
        }
        
    }
}