package com.airsmth.defines {
    import flash.events.*;
    import flash.net.*;
    import spark.components.TextInput;
    import spark.components.TextArea;
    import com.airsmth.defines.*;
    
    public class ReplyReadLoader {
        private var _post:Post;
        private var _loader:Loader;
        private var _tinput:TextInput;
        private var _tarea:TextArea;
        
        public function ReplyReadLoader(post:Post, input:TextInput, area:TextArea):void {
            _post = post;
            _tinput = input;
            _tarea = area;
            loadReply();
        }
        
        private function loadReply():void {
            _loader = new Loader(SMTH.BBSPST, _post.replydata);
            _loader.addEventListener(LoadEvent.LOADED, onReplyLoad);
            _loader.load();
        }
        
        private function onReplyLoad(event:Event):void {
            var _text:String = _loader.content;
            var p:RegExp = new RegExp("replyForm\\('.*?',\\d+,'(.*?)'");
            var p2:RegExp = new  RegExp("(\n【.*?)</textarea>", "s");
            var result:Object = p.exec(_text);
            var result2:Object = p2.exec(_text);
            if (result != null) _tinput.text = result[1];
            if (result2 != null) _tarea.text = result2[1];
        }
    }
}