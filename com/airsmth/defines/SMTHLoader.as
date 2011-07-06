package com.airsmth.defines {
    import flash.net.*;
    import flash.events.*;
    import flash.filesystem.*;
    import spark.components.List;
    import mx.collections.ArrayCollection;
    import com.airsmth.defines.*;
    
    [Bindable]
    public class SMTHLoader extends EventDispatcher {
        private var _auth:Auth;
        public var config:Config;
        public var acFavor:ArrayCollection;
        
        public function SMTHLoader(con:Config):void {
            config = con;
            _auth = new Auth(config.id, config.pass);
        }
        
        public function load():void {
            var ll:LoginLoader = new LoginLoader(_auth);
            ll.addEventListener(LoadEvent.LOGINSUCC, onLoginSucc);
            ll.addEventListener(LoadEvent.LOGINFAIL, onLoginFail);
            ll.load();
            dispatchEvent(new LoadEvent(LoadEvent.LOGINSTART));
        }
        
        private function onLoginSucc(event:Event):void {
            loadFavor();
        }
        
        private function onLoginFail(event:Event):void {
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
            acFavor = fl.data;
            dispatchEvent(new LoadEvent(LoadEvent.LOGINDONE));
        }
    }
    
}