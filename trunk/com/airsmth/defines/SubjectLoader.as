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
            // tconWriter('Gentleman',764,91857,91857,1,1,0,91839,91871,'关于表的厚度');
                                                      //bid               tpage pno        psub  nsub  title 
        	var p2:RegExp = new RegExp("tconWriter.*?(\\d+),\\d+,\\d+,(\\d+),(\\d+),\\d+,(\\d+),(\\d+),'(.*?)'");
            
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
            _sub.pthid = result2[4];
            _sub.nthid = result2[5];
            _sub.title = result2[6];
            
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