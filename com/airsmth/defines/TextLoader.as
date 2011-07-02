package com.airsmth.defines {
    import flash.events.*;
    import flash.net.*;
    import mx.collections.*;
    import com.airsmth.defines.*;
    
    public class TextLoader extends EventDispatcher {
        protected var _data:ArrayCollection;
        protected var _loader:Loader;
        
        public function TextLoader(url:String, data:URLVariables = null, method:String = URLRequestMethod.GET):void {
            _loader = new Loader(url, data, method);
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