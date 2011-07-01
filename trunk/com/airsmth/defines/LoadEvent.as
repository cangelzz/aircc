package com.airsmth.defines {

    import flash.events.*;

    public class LoadEvent extends Event {
    
        public static const LOADED:String="Loaded";
        
        public static const DONE:String = "Done";
        
        public function LoadEvent(type:String,bubbles:Boolean=false,cancelable:Boolean=false):void {
            super(type,bubbles,cancelable);
        }
    }
}