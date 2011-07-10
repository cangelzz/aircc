package com.airsmth.defines {
    import flash.events.*;
    import flash.net.*;
    import mx.collections.*;
    import com.airsmth.defines.*;
    
    public class TextLoader extends EventDispatcher {
        protected var _data:ArrayCollection;
        protected var _loader:BaseLoader;
        protected var _go:Boolean = true;
        
        public function TextLoader(url:String, data:Object = null, encoding:String = "gb2312", follow:Boolean = true):void {
            _loader = new BaseLoader(url, data, URLRequestMethod.GET, follow);
            _loader.encoding = encoding;
        }
        
        public function load():void {
            _loader.addEventListener(LoadEvent.LOADED, onLoad);
            _loader.addEventListener(LoadEvent.STATUS, onStatus);
            _loader.load();
            dispatchEvent(new LoadEvent(LoadEvent.LOADSTART));
        }
        
        protected function onLoad(event:Event):void {

        }
        
        protected function onStatus(event:Event):void {
        
        }
        
        public function get data():ArrayCollection {
            return _data;
        }
    }
}