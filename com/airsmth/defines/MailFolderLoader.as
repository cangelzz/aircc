package com.airsmth.defines {
    import flash.events.*;
    import flash.net.*;
    import mx.collections.ArrayCollection;
    import com.airsmth.defines.*;
    
    public class MailFolderLoader extends TextLoader {
        private var _path:String;
        
        public function MailFolderLoader(path:String):void {
            super(SMTH.MAILBOX, "path=" + path);
            _path = path;
        }
        
        public function get path():String {
            return _path;
        }
        
        override protected function onLoad(event:Event):void {
            //var nl:RegExp = /\n/g;
            //var text:String = _loader.content.substr(_loader.content.indexOf("mailM"));
            var text:String = _loader.content;
            var m:Mail;
            var ids:ArrayCollection = StringHelper.findall(new RegExp("^.*?mt3\">(\\d+).*$", "mg"), text);
            var flags:ArrayCollection = StringHelper.findall(new RegExp("^.*?mt4.*?nbsp;(.*?)&nbsp.*$", "mg"), text);
            var authors:ArrayCollection = StringHelper.findall(new RegExp("bbsqry.php.userid=(\\w+)", "g"), text);
            var titles:ArrayCollection = StringHelper.findall(new RegExp("mt5.*>(.*?)<\\/a", "g"), text);
            var filenos:ArrayCollection = StringHelper.findall(new RegExp("value=.(M.*?).", "g"), text);
            _data = new ArrayCollection();
            for (var i:Number = 0; i < ids.length; i++) {
                m = new Mail();
                m.path = _path;
                m.id = ids[i];
                m.flag = flags[i];
                m.author = authors[i];
                m.title = titles[i];
                m.fileno = filenos[i];
                _data.addItem(m);
            }
            m = new Mail();
            m.path = _path;
            m.id = "207";
            m.flag = "R";
            m.author = "testme";
            m.title = ids.length.toString() + " " + flags.length.toString() + 
                " " + authors.length.toString() + " " + titles.length.toString() + " " + filenos.length.toString() + " ";
            _data.addItem(m);
            dispatchEvent(new LoadEvent(LoadEvent.DONE));
        }
    }
}