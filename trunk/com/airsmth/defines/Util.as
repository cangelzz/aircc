package com.airsmth.defines {
    import flash.filesystem.*;
    import com.airsmth.defines.SMTH;

	public class Util {
        public static function getConfig():XML {
            var f:FileStream;
            var cf:File = SMTH.CONFIGPATH;
            if (!cf.exists) {
                var cx:XML = <config>
                                <auth>
                                   <id>guest</id>
                                   <pass></pass>
                                   <auto>true</auto>
                                </auth>
                                <option>
                                    <showsubject>true</showsubject>
                                    <showimg>true</showimg>
                                    <imgsize>0</imgsize>
                                    <showrefer>false</showrefer>
                                    <showlatest>true</showlatest>
                                </option>
                             </config>
                f = new FileStream();
                f.open(cf, FileMode.WRITE);
                f.writeUTFBytes(cx.toXMLString());
                f.close();
            }
            f = new FileStream();
            f.open(cf, FileMode.READ);
            var config:XML = XML(f.readUTFBytes(f.bytesAvailable));
            f.close();
            return config;
        }
        
        public static function saveConfig(config:XML):void {
            var f:FileStream = new FileStream();
            f.open(SMTH.CONFIGPATH, FileMode.WRITE);
            f.writeUTFBytes(config.toXMLString());
            f.close();
        }
        
	}
}