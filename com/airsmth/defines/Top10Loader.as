package com.airsmth.defines {
    import flash.events.*;
    import flash.net.*;
    import mx.collections.ArrayCollection;
    import com.airsmth.defines.*;
    
    public class Top10Loader extends TextLoader {
        
        public function Top10Loader():void {
            super(SMTH.TOP10);
        }
        
        override protected function onLoad(event:Event):void {
             var p:RegExp = new RegExp("board=(\\w+)&gid=(\\d+)", "i");
             var xml:XML = XML(_loader.utf8);
             _data = new ArrayCollection();
             
             for each(var item:XML in xml.item) {
                var sub:Subject = new Subject();
                sub.author = xml.author;
                var result:Object = p.exec(xml.link);
                sub.bname = result[1];
                sub.gid = result[2];
                sub.title = xml.title;
                _data.addItem(sub);
                
             }
             
             dispatchEvent(new LoadEvent(LoadEvent.DONE));
        }
    }
}