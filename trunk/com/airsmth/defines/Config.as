package com.airsmth.defines {

    [Bindable]
	public class Config {
        private var xml:XML;
        
        public function get id():String {
            return xml.auth.id;
        }
        
        public function get pass():String {
            return xml.auth.pass
        }
        
        public function get auto():Boolean {
            return xml.auth.auto == "true";
        }
        
        public function get showsubject():Boolean {
            return xml.auth.showsubject == "true";
        }
        
        public function get showlatest():Boolean {
            return xml.auth.showlatest == "true";
        }
        
        public function get showrefer():Boolean {
            return xml.auth.showrefer == "true";
        }
        
        public function get showimg():Boolean {
            return xml.auth.showimg == "true";
        }
    }
}