package com.airsmth.defines {
	import flash.events.*;
    import flash.net.*;
    import com.airsmth.defines.*;
    
    public class ForwardSender extends TextSender {
        private var _forward:Forward;

        public function ForwardSender(forward:Forward):void {
            super(SMTH.BBSFWD, forward.data);
            _forward = forward;
        }
        
        override protected function onLoad(event:Event):void {
            var _text:String = _loader.content;
            if (_text.indexOf("操作成功") != -1) dispatchEvent(new LoadEvent(LoadEvent.DONE));
            else dispatchEvent(new LoadEvent(LoadEvent.LOADFAIL));
        }
    }
}