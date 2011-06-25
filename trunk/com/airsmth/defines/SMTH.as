package com.airsmth.defines {
    import flash.net.*;
    import flash.events.*;
    import mx.controls.Tree;
    //import spark.component.DataGrid;
    import mx.collections.ArrayCollection;
    import com.airsmth.defines.*;
    
    public class SMTH {
        public static const BBSDOC:String = "http://www.newsmth.net/bbsdoc.php";
        public static const BBSCON:String = "http://www.newsmth.net/bbscon.php";
        public static const BBSTCON:String = "http://www.newsmth.net/bbstcon.php";
        public static const LOGINURL:String = "http://www.newsmth.net/bbslogin.php?mainurl=atomic.php";
        public static const ATOMIC:String = "http://www.newsmth.net/atomic.php";
        private var _login:Login;
        private var _loader:Loader;
        private var isLoggedIn:Boolean = false;
        private var isFavorUpdated:Boolean = false;
        public var acFavor:ArrayCollection;
        private var _vboard:Tree;
        
        public function SMTH(login:Login, vboard:Tree):void {
            _login = login;
            _vboard = vboard;
        }
        
        public function login():void {
            _loader = new Loader(LOGINURL, _login.data, "POST");
            _loader.addEventListener(LoadEvent.LOADED, onLogin);
            _loader.load();
        }
        
        private function onLogin(event:Event):void {
            var content:String = _loader.content;
            if (content.indexOf("location.href") != -1) {
                isLoggedIn = true;
                if (!isFavorUpdated) updateFavor();
            }
            else {
                isLoggedIn = false;
            }
        }
        
        private function updateFavor():void {
            _loader = new Loader(ATOMIC);
            _loader.addEventListener(LoadEvent.LOADED, onUpdateFavor);
            _loader.load();
        }
        
        private function onUpdateFavor(event:Event):void {
            var content:String = _loader.content;
            var p:RegExp = new RegExp("act=board&board=(\\w+)", "g");
            var result:Object = p.exec(content);
            acFavor = new ArrayCollection();
            while (result != null) {
                var board:Board = new Board();
                board.bname = result[1];
                board.ftype = "6";
                acFavor.addItem(board);
                result = p.exec(content);
            }
            _vboard.dataProvider = acFavor;
            isFavorUpdated = true;
        }
    }
    
}