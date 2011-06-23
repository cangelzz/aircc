package com.airsmth.defines {
    [Bindable]
    public class Post {
    	public var bid:String = null;
    	public var pid:String = null;
    	public var author:String = null;
    	public var content:String = null;
    	public function url():String {
    		return "http://www.newsmth.net/bbscon.php?bid=" + bid + "&id=" + pid;
    	}
    }
}