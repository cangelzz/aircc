﻿package com.airsmth.defines {
    import flash.events.*;
    import flash.net.*;
    import mx.collections.ArrayCollection;
    import com.airsmth.defines.*;
    
    public class Top10Loader extends TextLoader {
        public var debug:String;
        private var _section:Section;
        
        public function Top10Loader(section:Section):void {
            super(SMTH.TOP10, section.data, "utf-8");
            _section = section;
        }
        
        public function get section():Section {
            return _section;
        }
        
        override protected function onLoad(event:Event):void {
             var p:RegExp = new RegExp("board=(.*?)&gid=(\\d+)", "i");
             var xml:XML = XML(_loader.content);
             _data = new ArrayCollection();
             
             for each(var item:XML in xml.channel.item ) {
                var sub:Subject = new Subject();
                sub.author = item.author;
                
                var result:Object = p.exec(item.link);
                sub.bname = result[1];
                sub.gid = result[2];
                sub.title = item.title;
                sub.preview = getPreview(item.description);
                _data.addItem(sub);
                
             }
             debug = _loader.content;
             dispatchEvent(new LoadEvent(LoadEvent.DONE));
        }
        
        private function getPreview(s:String):String {
            var start:Number = s.indexOf("站内") + 2;
            var end:Number = s.indexOf("※");
            var content:String;
            if (end != -1) content = s.substring(start, end);
            else content = s.substring(start);
            content = content.replace(/<br\/>/g, "\n");
            content = StringHelper.trim(content, "\n");
            return content;
        }
    }
}