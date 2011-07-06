package com.airsmth.defines {

    [Bindable]
	public class Config {
        public var config:XML;
        
        public function get id():String {
            return config.auth.id;
        }
    }
}