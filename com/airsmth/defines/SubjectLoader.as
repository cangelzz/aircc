package com.airsmth.defines {
    import flash.events.*;
    import flash.net.*;
    import mx.collections.ArrayCollection;
    import com.airsmth.defines.*;
    
    public class SubjectLoader extends TextLoader {
        private var _sub:Subject;
        
        public function SubjectLoader(sub:Subject):void {
            super(SMTH.BBSTCON, sub.data);
            _sub = sub;
        }
        
        public function get subject():Subject {
            return _sub;
        }
        
        override protected function onLoad(e:Event):void {
        	var content:String = _loader.content;
        	var p:RegExp = new RegExp("\\[(\\d+),'(.*?)'\\]", "g");
        	var p2:RegExp = new RegExp("tconWriter.*?(\\d+),\\d+,\\d+,(\\d+),(\\d+),\\d+,\\d+,\\d+,'(.*?)'");
        	var result:Object = p.exec(content);
        	var result2:Object = p2.exec(content);
            var i:Number;
        	if (result == null || result2 == null) 
        	{
        		return;
        	}
        	var bid:String = result2[1];
            _sub.tpage = Number(result2[2]);
            _sub.pno = Number(result2[3]);
            
        	var lines:ArrayCollection = new ArrayCollection();
        	var cnt:Number = 0;
        	while (result != null) {
        		var po:Post = new Post();
                po.lz = _sub.author;
        		po.bid = bid;
        		po.id = result[1];
        		po.author = result[2];
        		lines.addItem(po);
				cnt++;
        		result = p.exec(content);
        	}
        	
        	_data = lines;
            dispatchEvent(new LoadEvent(LoadEvent.DONE));
			
        } //end onSubjectLoad
    }
}