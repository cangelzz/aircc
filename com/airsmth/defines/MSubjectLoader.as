package com.airsmth.defines {
    import flash.events.*;
    import flash.net.*;
    import mx.collections.*;
    import spark.components.ViewNavigator;
    import com.airsmth.defines.*;
    
    public class MSubjectLoader {
        private var _sub:Subject;
        private var _list:ViewNavigator;
        private var _loader:Loader;
        
        public function MSubjectLoader(event:Event, grid:ViewNavigator):void {
            _sub = event.currentTarget.selectedItem as Subject;
            _list = grid;
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
        	if (result == null || result2 == null) 
        	{
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
        		new PostLoader(lines.getItemAt(i) as Post, _list, i);
        	}
        	
        	_list.pushView(com.airsmth.views.Subject, lines);
			
        } //end onSubjectLoad
    }
}