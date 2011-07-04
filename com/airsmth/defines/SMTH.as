package com.airsmth.defines {
    import flash.net.*;
    import flash.events.*;
    import flash.filesystem.*;
    import spark.components.List;
    import mx.collections.ArrayCollection;
    import com.airsmth.defines.*;
    
    public class SMTH extends EventDispatcher {
        public static var _smth:SMTH;
        public static const BBSDOC:String = "http://www.newsmth.net/bbsdoc.php";
        public static const BBSCON:String = "http://www.newsmth.net/bbscon.php";
        public static const BBSTCON:String = "http://www.newsmth.net/bbstcon.php";
        public static const BBSPST:String = "http://www.newsmth.net/bbspst.php";
        public static const BBSSND:String = "http://www.newsmth.net/bbssnd.php";
        public static const BBSSEL:String = "http://www.newsmth.net/bbssel.php";
        public static const LOGINURL:String = "http://www.newsmth.net/bbslogin.php?mainurl=atomic.php";
        public static const ATOMIC:String = "http://www.newsmth.net/atomic.php";
        public static const BBSFAV:String = "http://www.newsmth.net/bbsfav.php"
        public static const CONFIGPATH:File = File.applicationStorageDirectory.resolvePath("config.xml");
        private var _auth:Auth;
        private var _config:XML;
        private var isLoggedIn:Boolean = false;
        private var isFavorUpdated:Boolean = false;
        public var acFavor:ArrayCollection;
        
        public static function get smth():SMTH {
            if (_smth == null) {
                _smth = new SMTH();
            }
            return _smth;
        }
        
        public function SMTH():void {
        }
        
        public function input(config:XML):SMTH {
            _config = config;
            _auth = new Auth(config.auth.id, config.auth.pass);
            return _smth;
        }
        
        public function get config():XML {
            return _config;
        }
        
        public function saveConfig(config:XML):void {
            var f:FileStream = new FileStream();
            f.open(CONFIGPATH, FileMode.WRITE);
            f.writeUTFBytes(config.toXMLString());
            f.close();
        }
        
        public function login():void {
            var ll:LoginLoader = new LoginLoader(_auth);
            ll.addEventListener(LoadEvent.LOGINSUCC, onLoginSucc);
            ll.addEventListener(LoadEvent.LOGINFAIL, onLoginFail);
            ll.load();
            dispatchEvent(new LoadEvent(LoadEvent.LOGINSTART));
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
            dispatchEvent(new LoadEvent(LoadEvent.LOGINFAIL));
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
            dispatchEvent(new LoadEvent(LoadEvent.LOGINSUCC));
        }
    }
    
}