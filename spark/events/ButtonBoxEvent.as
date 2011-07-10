package spark.events
{
	import flash.events.Event;
	
	public class ButtonBoxEvent extends Event
	{
		public static const OPENED:String = "opened";
		public static const CLOSED:String = "closed";
		public static const SELECTED:String = "selected";
		
		
		public function ButtonBoxEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			return new ButtonBoxEvent(type,bubbles,cancelable);
		}
	}
}