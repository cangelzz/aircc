package com.airsmth.defines {
    import flash.utils.ByteArray;
    import mx.collections.ArrayCollection;

    public class StringHelper {

        public static function replace(str:String, oldSubStr:String, newSubStr:String):String {
            return str.split(oldSubStr).join(newSubStr);
        }
    
        public static function trim(str:String, char:String):String {
            return trimBack(trimFront(str, char), char);
        }
    
        public static function trimFront(str:String, char:String):String {
            char = stringToCharacter(char);
            if (str.charAt(0) == char) {
                str = trimFront(str.substring(1), char);
            }
            return str;
        }
    
        public static function trimBack(str:String, char:String):String {
            char = stringToCharacter(char);
            if (str.charAt(str.length - 1) == char) {
                str = trimBack(str.substring(0, str.length - 1), char);
            }
            return str;
        }
    
        public static function stringToCharacter(str:String):String {
            if (str.length == 1) {
                return str;
            }
            return str.slice(0, 1);
        }
        
        public static function gb2312(str:String):String {
            var byte:ByteArray = new ByteArray();
            byte.writeMultiByte(str, "gb2312");
            return byte.toString();
        }
        
        public static function findall(pat:RegExp, text:String):ArrayCollection {
            var lines:ArrayCollection = new ArrayCollection();
            var result:Object = pat.exec(text);
            while (result != null) {
                lines.addItem(result[1]);
                result = pat.exec(text);
            }
            return lines;
        }
    }
}