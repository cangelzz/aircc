package com.airsmth.defines {
    import flash.net.*;
    import flash.events.*;
    import spark.components.List;
    import mx.collections.ArrayCollection;
    import com.airsmth.defines.*;
    
    public class SMTH {
        public static var _smth:SMTH;
        public static const BBSDOC:String = "http://www.newsmth.net/bbsdoc.php";
        public static const BBSCON:String = "http://www.newsmth.net/bbscon.php";
        public static const BBSTCON:String = "http://www.newsmth.net/bbstcon.php";
        public static const BBSPST:String = "http://www.newsmth.net/bbspst.php";
        public static const BBSSND:String = "http://www.newsmth.net/bbssnd.php";
        public static const LOGINURL:String = "http://www.newsmth.net/bbslogin.php?mainurl=atomic.php";
        public static const ATOMIC:String = "http://www.newsmth.net/atomic.php";
        private var _auth:Auth;
        private var isLoggedIn:Boolean = false;
        private var isFavorUpdated:Boolean = false;
        public var acFavor:ArrayCollection;
        private var _vboard:List;
        
        public static function smth():SMTH {
            if (_smth == null) {
                _smth = new SMTH();
            }
            return _smth;
        }
        
        public function SMTH():void {
        }
        
        public function input(auth:Auth, vboard:List):SMTH {
            _auth = auth;
            _vboard = vboard;
            return _smth;
        }
        
        public function login():void {
            var ll:LoginLoader = new LoginLoader(_auth);
            ll.addEventListener(LoadEvent.LOGINSUCC, onLoginSucc);
            ll.addEventListener(LoadEvent.LOGINFAIL, onLoginFail);
            ll.load();
        }
        
        private function onLoginSucc(event:Event):void {
            //var ll:LoginLoader = event.currentTarget as LoginLoader;
            isLoggedIn = true;
            loadFavor();
        }
        
        private function onLoginFail(event:Event):void {
            isLoggedIn = false;
            var l:ArrayCollection = new ArrayCollection(["Apple", "AutoWorld", "Children", "FamilyLife"]);
            acFavor = new ArrayCollection();
            var board:Board;
            for each(var b:String in l) {
                board = new Board();
                board.bname = b;
                board.ftype = "6";
                acFavor.addItem(board);
            }
            _vboard.dataProvider = acFavor;
        }
        
        public function loadFavor():void {
            var fl:FavorLoader = new FavorLoader();
            fl.addEventListener(LoadEvent.DONE, onFavorLoad);
            fl.load();
        }
        
        private function onFavorLoad(event:Event):void {
            var fl:FavorLoader = event.currentTarget as FavorLoader;
            isFavorUpdated = true;
            acFavor = fl.data;
            _vboard.dataProvider = acFavor;
        }
    }
    
}