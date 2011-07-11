package com.airsmth.defines {
    import flash.filesystem.*;
    import mx.collections.ArrayCollection;
    import com.airsmth.defines.SMTH;
    import mx.utils.Base64Encoder;
    import mx.utils.Base64Decoder;

	public class Util {
        public static function getConfig():Config {
            var f:FileStream;
            var cf:File = SMTH.CONFIGPATH;
            if (!cf.exists) {
                var cx:XML = <config>
                                <auth>
                                   <id>guest</id>
                                   <pass></pass>
                                   <auto>false</auto>
                                </auth>
                                <option>
                                    <showsubject>true</showsubject>
                                    <showimg>true</showimg>
                                    <imgsize>0</imgsize>
                                    <showrefer>false</showrefer>
                                    <showlatest>true</showlatest>
                                    <showbottom>true</showbottom>
                                    <autoupdate>false</autoupdate>
                                    <defaulttarget></defaulttarget>
                                    <directforward>false</directforward>
                                </option>
                             </config>
                f = new FileStream();
                f.open(cf, FileMode.WRITE);
                f.writeUTFBytes(cx.toXMLString());
                f.close();
            }
            f = new FileStream();
            f.open(cf, FileMode.READ);
            var config:Config = new Config(XML(f.readUTFBytes(f.bytesAvailable)));
            f.close();
            return config;
        }
        
        public static function saveConfig(config:Config):void {
            var cx:XML = <config></config>;
            var auth:XML = <auth>
                             <id>{config.id}</id>
                             <pass>{config.pass}</pass>
                             <auto>{config.auto}</auto>
                           </auth>
            cx.appendChild(auth);
            var options:XML = <option>
                              <showsubject>{config.showsubject}</showsubject>
                              <showimg>{config.showimg}</showimg>
                              <imgsize>{config.imgsize}</imgsize>
                              <showrefer>{config.showrefer}</showrefer>
                              <showlatest>{config.showlatest}</showlatest>
                              <showbottom>{config.showbottom}</showbottom>
                              <autoupdate>{config.autoupdate}</autoupdate>
                              <defaulttarget>{config.defaulttarget}</defaulttarget>
                              <directforward>{config.directforward}</directforward>
                          </option>
            cx.appendChild(options);
            var f:FileStream = new FileStream();
            f.open(SMTH.CONFIGPATH, FileMode.WRITE);
            f.writeUTFBytes(cx.toXMLString());
            f.close();
        }
        
        public static function encode(pass:String):String {
            return pass;
        }
        
        public static function decode(source:String):String {
            return source;
        }
        
        public static function isInFavor(bname:String, list:ArrayCollection):Boolean {
            var flag:Boolean = false;
            for each(var board:Board in list.source) {
                if (board.bname == bname) {
                    flag = true;
                    break;
                }
            }
            return flag;
        }
	}
}