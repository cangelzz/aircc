package com.airsmth.defines {
    import com.airsmth.defines.Util;

    [Bindable]
	public class Config {
        private var xml:XML;
        
        public function Config(xmlstring:XML):void {
            xml = xmlstring;
        }
        
        public function get id():String {
            return xml.auth.id;
        }
        
        public function get pass():String {
            return Util.decode(xml.auth.pass);
        }
        
        public function get auto():Boolean {
            return xml.auth.auto == "true";
        }
        
        public function get showsubject():Boolean {
            return xml.option.showsubject == "true";
        }
        
        public function get showlatest():Boolean {
            return xml.option.showlatest == "true";
        }
        
        public function get showrefer():Boolean {
            return xml.option.showrefer == "true";
        }
        
        public function get showimg():Boolean {
            return xml.option.showimg == "true";
        }
        
        public function get showbottom():Boolean {
            return xml.option.showbottom == "true";
        }
        
        public function get imgsize():Number {
            return Number(xml.option.imgsize);
        }
        
        public function set id(_id:String):void {
            xml.auth.id = _id;
        }
        
        public function set pass(_pass:String):void {
            xml.auth.pass = Util.encode(_pass);
        }
        
        public function set auto(op:Boolean):void {
            xml.auth.auto = op;
        }
        public function set showsubject(op:Boolean):void {
            xml.option.showsubject = op;
        }
        public function set showlatest(op:Boolean):void {
            xml.option.showlatest = op;
        }
        public function set showrefer(op:Boolean):void {
            xml.option.showrefer = op;
        }
        public function set showimg(op:Boolean):void {
            xml.option.showimg = op;
        }
        public function set imgsize(op:Number):void {
            xml.option.imgsize = op;
        }
        public function set showbottom(op:Boolean):void {
            xml.option.showbottom = op;
        }
        
    }
}