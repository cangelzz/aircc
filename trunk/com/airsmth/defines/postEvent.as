package com.airsmth.defines {
	import flash.events.*;
	
	public class postEvent extends Event {
		public static const LOADED:String = "PostLoaded";
		public function postEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false):void {
			super(type, bubbles, cancelable);
		}
	}
}