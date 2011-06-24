package com.airsmth.defines {
    import flash.events.*;
    import flash.net.*;
    import mx.collections.*;
    import mx.controls.Alert;
    import spark.components.DataGrid;
    import com.airsmth.defines.*;
    
    public class SubjectLoader {
        private var _sub:Subject;
        private var _grid:DataGrid;
        private var _loader:Loader;
        
        public function SubjectLoader(event:Event, grid:DataGrid):void {
            _sub = event.currentTarget.selectedItem as Subject;
            _grid = grid;
            loadSubject();
        }
        
        private function loadSubject():void {
            _loader = new Loader(SMTH.BBSTCON, _sub.data);
            _loader.addEventListener(LoadEvent.LOADED, onSubjectLoad);
            _loader.load();
        }
        
        private function onSubjectLoad(e:Event):void
        {
        	var content:String = _loader.content;
        	var p:RegExp = new RegExp("\\[(\\d+),'(.*?)'\\]", "g");
        	var p2:RegExp = new RegExp("tconWriter.*?(\\d+),\\d+,\\d+,(\\d+),(\\d+),\\d+,\\d+,\\d+,'(.*?)'");
        	var result:Object = p.exec(content);
        	var result2:Object = p2.exec(content);
        	if (result == null || result2 == null) 
        	{
        		Alert.show("Error occurred");
        		return;
        	}
        	var bid:String = result2[1];
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
        	
        	for (var i:Number = 0; i < lines.length; i++) {
        		//ploaders.addItem(new PostLoader(lines.getItemAt(i) as Post, postList, i));
        		new PostLoader(lines.getItemAt(i) as Post, _grid, i);
        	}
        	
        	_grid.dataProvider = lines;
        	
			
        } //end onSubjectLoad
    }
}