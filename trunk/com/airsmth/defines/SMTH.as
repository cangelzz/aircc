package com.airsmth.defines {
    import flash.net.*;
    import flash.events.*;
    import flash.filesystem.*;
    import spark.components.List;
    import mx.collections.ArrayCollection;
    import com.airsmth.defines.*;
    
    public class SMTH {
        public static const BBSDOC:String = "http://www.newsmth.net/bbsdoc.php";
        public static const BBSCON:String = "http://www.newsmth.net/bbscon.php";
        public static const BBSTCON:String = "http://www.newsmth.net/bbstcon.php";
        public static const BBSPST:String = "http://www.newsmth.net/bbspst.php";
        public static const BBSSND:String = "http://www.newsmth.net/bbssnd.php";
        public static const BBSSEL:String = "http://www.newsmth.net/bbssel.php";
        public static const BBSFWD:String = "http://www.newsmth.net/bbsfwd.php?do";
        public static const MAILBOX:String = "http://www.newsmth.net/bbsmailbox.php";
        public static const LOGINURL:String = "http://www.newsmth.net/bbslogin.php?mainurl=atomic.php";
        public static const ATOMIC:String = "http://www.newsmth.net/atomic.php";
        public static const BBSFAV:String = "http://www.newsmth.net/bbsfav.php"
        public static const BBSBOA:String = "http://www.newsmth.net/bbsboa.php";
        public static const MAILCON:String = "http://www.newsmth.net/bbsmailcon.php";
        public static const SENDMAIL:String = "http://www.newsmth.net/bbssendmail.php";
        public static const PSTMAIL:String = "http://www.newsmth.net/bbspstmail.php";
        public static const ACTMAIL:String = "http://www.newsmth.net/bbsmailact.php";
        public static const TOP10:String = "http://www.newsmth.net/rssi.php";
        public static const BBSFIND:String = "http://www.newsmth.net/bbsbfind.php"
        public static const CONFIGPATH:File = File.applicationStorageDirectory.resolvePath("config.xml");
        [Bindable]
        public var config:Config;
        [Bindable]
        public var acFavor:ArrayCollection;
        [Bindable]
        public var isLoggedOn:Boolean = false;
        
        public var isNewMail:Boolean = false;
        public var newmailcnt:String = "";
        
        public function SMTH(con:Config):void {
            config = con;
        }
        
        public function get isGuest():Boolean {
            return config.id == "guest";
        }
        
    }
    
}