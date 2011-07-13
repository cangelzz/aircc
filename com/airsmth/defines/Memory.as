package com.airsmth.defines { 
    import flash.net.LocalConnection; 
    import flash.system.System; 
    public class Memory { 
        public function Memory() { 
        //TO DO 
        } 
        public static function gc() : void { 
            try { 
                new LocalConnection().connect( 'foo' ); 
                new LocalConnection().connect( 'foo' ); 
            } catch ( e : * ) {} 
        } 
        public static function get used() : Number { 
            return System.totalMemory; 
        } 
    } 
}