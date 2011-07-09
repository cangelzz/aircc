package com.airsmth.defines {
    import flash.events.*;
    import flash.net.*;
    import com.airsmth.defines.*;
    
    public class ReplyReadLoader extends TextLoader {
        private var _post:Post;
        private var _reply:Reply;
        
        public function ReplyReadLoader(post:Post):void {
            super(SMTH.BBSPST, post.replydata);
            _post = post;
            _reply = new Reply();
            _reply.bname = _post.bname;
            _reply.id = _post.id;
        }
        
        public function get reply():Reply {
            return _reply;
        }
        
        override protected function onLoad(event:Event):void {
            var _text:String = _loader.content;   //bname, reid  title, x, totalsig  lastsig
            var p:RegExp = new RegExp("replyForm\\('.*?',\\d+,'(.*?)',\\d,(\\d),(\\d)");
            var p2:RegExp = new  RegExp("(\n【.*?)</textarea>", "s");
            var result:Object = p.exec(_text);
            var result2:Object = p2.exec(_text);
            if (result != null) {
                if (result[1].substr(0, 3) != "Re:") _reply.title = "Re: " + result[1];
                else _reply.title = result[1];
                _reply.totalsig = result[2];
                _reply.lastsig = result[3];
            }
            if (result2 != null) _reply.content = result2[1];
            if (_post.id == "0") { 
                _reply.title = "";
                _reply.content = "";
            }
            dispatchEvent(new LoadEvent(LoadEvent.DONE));
        }
    }
}