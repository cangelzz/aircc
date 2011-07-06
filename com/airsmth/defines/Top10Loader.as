package com.airsmth.defines {
    import flash.events.*;
    import flash.net.*;
    import mx.collections.ArrayCollection;
    import com.airsmth.defines.*;
    
    public class Top10Loader extends TextLoader {
        public var debug:String;
        
        public function Top10Loader():void {
            super(SMTH.TOP10, "", "utf-8");
        }
        
        override protected function onLoad(event:Event):void {
             var p:RegExp = new RegExp("board=(\\w+)&gid=(\\d+)", "i");
             var xml:XML = XML(_loader.content);
             _data = new ArrayCollection();
             
             for each(var item:XML in xml.channel.item ) {
                var sub:Subject = new Subject();
                sub.author = item.author;
                
                var result:Object = p.exec(item.link);
                sub.bname = result[1];
                sub.gid = result[2];
                sub.title = item.title;
                //sub.preview = item.description;
                _data.addItem(sub);
                
             }
             debug = _loader.content;
             dispatchEvent(new LoadEvent(LoadEvent.DONE));
        }
    }
}