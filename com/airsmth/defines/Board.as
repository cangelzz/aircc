﻿package com.airsmth.defines {
    import flash.net.*;
    
    [Bindable]
    public class Board {
    	public var bname:String = null;
        public var cname:String = "";
    	public var bid:String = null;
        public var ftype:String = "6";
        public var delid:String;
        public var page:Number = 0;
        public var total:Number;
        public var start:Number;
        public var delflag:Boolean = false;
        public function get data():URLVariables {
            var _data:URLVariables = new URLVariables();
            _data.board = bname;
            _data.ftype = ftype;
            _data.page = page.toString();
            return _data;
        }
    }
}