package com.airsmth.defines {
    import flash.net.*;
    
    [Bindable]
    public class Subject {
    	public var bname:String = null;
    	public var bid:String = null;
    	public var pid:String = null;
    	public var gid:String = null;
    	public var rid:String = null;
    	public var flag:String = null;
    	public var author:String = null;
    	public var time:String = null;
    	public var size:String = null;
    	public var title:String = null;
        public var pno:Number = 1;
        public var tpage:Number;
        public var lz:String = "";
        
        public function get data():URLVariables {
            var _data:URLVariables = new URLVariables();
            _data.board = bname;
            _data.gid = gid;
            _data.pno = pno.toString();
            return _data;
        }
        
        public function get m():Boolean {
            return new RegExp("/m/i").test(flag);
        }
        public function get g():Boolean {
            return new RegExp("/g/i").test(flag);
        }
        public function get a():Boolean {
            return new RegExp("/@/i").test(flag);
        }
        public function get d():Boolean {
            return new RegExp("/d/i").test(flag);
        }
    }
}