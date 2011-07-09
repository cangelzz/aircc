package com.airsmth.defines {
    import flash.net.*;
    
    [Bindable]
    public class Section {
        public var id:String;
        public var title:String;
        
        public function Section(t:String, s:String = "0"):void {
            title = t;
            id = s;
        }
        
        public function get data():URLVariables {
            var _data:URLVariables = new URLVariables();
            if (id == "0") {
                _data.h = "1";
                return _data;
            }
            else {
                _data.h = "2";
                _data.s = id.toString();
                return _data;
            }
        }
    }
}