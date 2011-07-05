package com.airsmth.defines {
    import flash.events.*;
    import flash.net.*;
    import mx.collections.*;
    import com.airsmth.defines.*;
    
    public class TextLoader extends EventDispatcher {
        protected var _data:ArrayCollection;
        protected var _loader:BaseLoader;
        
        public function TextLoader(url:String, data:Object = null):void {
            _loader = new BaseLoader(url, data, URLRequestMethod.GET);
        }
        
        public function load():void {
            _loader.addEventListener(LoadEvent.LOADED, onLoad);
            _loader.load();
        }
        
        protected function onLoad(event:Event):void {

        }
        
        public function get data():ArrayCollection {
            return _data;
        }
    }
}