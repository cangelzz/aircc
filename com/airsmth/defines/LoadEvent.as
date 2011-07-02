package com.airsmth.defines {

    import flash.events.*;

    public class LoadEvent extends Event {
    
        public static const LOADED:String="Loaded";
        public static const DONE:String = "Done";
        public static const LOGINSUCC:String = "Login Success";
        public static const LOGINFAIL:String = "Login Fail";
        public static const LOGINSTART:String = "Login Start";
        
        public function LoadEvent(type:String,bubbles:Boolean=false,cancelable:Boolean=false):void {
            super(type,bubbles,cancelable);
        }
    }
}