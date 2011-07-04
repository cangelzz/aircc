package com.airsmth.defines {
    import flash.events.*;
    import flash.net.*;
    import mx.collections.ArrayCollection;
    import com.airsmth.defines.*;
    
    public class MailFolderLoader extends TextLoader {
        private var _box:MailBox;
        private var _path:String;
        private var _prev:String = null;
        private var _next:String = null;
        
        public function MailFolderLoader(mb:MailBox):void {
            super(SMTH.MAILBOX, mb.data);
            _path = mb.path;
            _box = mb;
        }
        
        public function get box():MailBox {
            return _box;
        }
        
        public function get path():String {
            return _path;
        }
        
        public function get prev():String {
            return _prev;
        }
        
        public function get next():String {
            return _next;
        }
        
        override protected function onLoad(event:Event):void {
            //var nl:RegExp = /\n/g;
            //var text:String = _loader.content.substr(_loader.content.indexOf("mailM"));
            var text:String = _loader.content;
            var p:RegExp = new RegExp("<a href=.bbsmailbox.php.path=" + _path + "&start=(\\d+).*?>(.*?)<\\/a>", "g");
            var result:Object = p.exec(text);
            while (result != null)  {
                if (result[2] == "上一页") _prev = result[1];
                if (result[2] == "下一页") _next = result[1];
                result = p.exec(text);
            }
            var m:Mail;
            var ids:ArrayCollection = StringHelper.findall(new RegExp("&num=(\\d+)&", "g"), text);
            var flags:ArrayCollection = StringHelper.findall(new RegExp("^.*?mt4.*?nbsp;(.*?)&nbsp.*$", "mg"), text);
            var authors:ArrayCollection = StringHelper.findall(new RegExp("bbsqry.php.userid=(\\w+)", "g"), text);
            var titles:ArrayCollection = StringHelper.findall(new RegExp("mt5.*>(.*?)<\\/a", "g"), text);
            var filenos:ArrayCollection = StringHelper.findall(new RegExp("file=(.*?)&title", "g"), text);
            _data = new ArrayCollection();
            for (var i:Number = 0; i < ids.length; i++) {
                m = new Mail();
                m.path = _path;
                m.id = ids[i];
                m.flag = flags[i];
                m.author = authors[i];
                m.title = titles[i];
                m.fileno = filenos[i];
                _data.addItemAt(m, 0);
            }
            //m = new Mail();
            //m.path = _path;
            //m.id = "207";
            //m.flag = "R";
            //m.author = "testme";
            //m.title = ids.length.toString() + " " + flags.length.toString() + 
            //    " " + authors.length.toString() + " " + titles.length.toString() + " " + filenos.length.toString() + " ";
            //_data.addItem(m);
            dispatchEvent(new LoadEvent(LoadEvent.DONE));
        }
    }
}