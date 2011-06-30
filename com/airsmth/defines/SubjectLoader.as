package com.airsmth.defines {
    import flash.events.*;
    import flash.net.*;
    import mx.collections.*;
    import spark.components.List;
    import spark.components.Button;
    import spark.components.ComboBox;
    import com.airsmth.defines.*;
    
    public class SubjectLoader {
        private var _sub:Subject;
        private var _list:List;
        private var _loader:Loader;
        private var _prevBtn:Button;
        private var _nextBtn:Button;
        private var _jump:ComboBox;
        
        public function SubjectLoader(sub:Subject, grid:List, prevBtn:Button = null, nextBtn:Button = null,
            jump:ComboBox = null):void {
            _sub = sub;
            _list = grid;
            _prevBtn = prevBtn;
            _nextBtn = nextBtn;
            _jump = jump;
            loadSubject();
        }
        
        private function loadSubject():void {
            _loader = new Loader(SMTH.BBSTCON, _sub.data);
            _loader.addEventListener(LoadEvent.LOADED, onSubjectLoad);
            _loader.load();
        }
        
        private function onSubjectLoad(e:Event):void {
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
            if ((_prevBtn != null) && (_nextBtn != null)) {
                if (_sub.tpage == 1) {
                    _prevBtn.enabled = false;
                    _nextBtn.enabled = false;
                    _jump.enabled = false;
                }
                if (_sub.pno > 1) _prevBtn.enabled = true;
                else _prevBtn.enabled = false;
                if (_sub.pno < _sub.tpage) _nextBtn.enabled = true;
                else _nextBtn.enabled = false;
                var pages:ArrayCollection = new ArrayCollection();
                for (i = 1; i <= _sub.tpage; i++) { pages.addItem(i); }
                _jump.dataProvider = pages;
                _jump.selectedIndex = _sub.pno - 1;
            }

            
        	var lines:ArrayCollection = new ArrayCollection();
        	var cnt:Number = 0;
        	while (result != null) {
        		var po:Post = new Post();
        		po.bid = bid;
        		po.id = result[1];
        		po.author = result[2];
        		lines.addItem(po);
				cnt++;
        		result = p.exec(content);
        	}
        	
        	for (i = 0; i < lines.length; i++) {
        		//ploaders.addItem(new PostLoader(lines.getItemAt(i) as Post, postList, i));
        		new PostLoader(lines.getItemAt(i) as Post, _list, i);
        	}
        	
        	_list.dataProvider = lines;
        	
			
        } //end onSubjectLoad
    }
}