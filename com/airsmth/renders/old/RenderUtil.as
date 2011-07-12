package com.airsmth.renders {
    import spark.skins.spark.DefaultItemRenderer;
    import mx.core.ClassFactory;
    import com.airsmth.renders.*;
    import com.airsmth.defines.*;
    public class RenderUtil {
        public static function selectRenderer(item:Object):ClassFactory {
            var c:ClassFactory;
            if (item is String) c = new ClassFactory(DefaultItemRenderer);
            else if (item is Board) c = new ClassFactory(BoardListRenderer);
            else if (item is Subject) c = new ClassFactory(ThreadListRenderer);
            else if (item is Post) c = new ClassFactory(PostListRenderer);
            else if (item is Mail) c = new ClassFactory(MailListRenderer);
            return c;
        }
    }
}