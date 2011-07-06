package com.airsmth.defines {
    import flash.events.*;
    import flash.net.*;
    import mx.collections.ArrayCollection;
    import com.airsmth.defines.*;
    
    public class Top10Loader extends TextLoader {
        
        public function Top10Loader():void {
            super(SMTH.TOP10);
        }
        
        override protected function onLoad(event:Event):void {
             var xml:XML = XML(_loader.utf8);
             
             dispatchEvent(new LoadEvent(LoadEvent.DONE));
        }
    }
}