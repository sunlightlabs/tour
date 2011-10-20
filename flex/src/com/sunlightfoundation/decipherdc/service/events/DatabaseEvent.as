package com.sunlightfoundation.decipherdc.service.events
{
	import flash.events.Event;
	
	public class DatabaseEvent extends Event
	{
		public static const READY:String = "DatabaseEvent.ready";
		public static const CONNECTED:String = "DatabaseEvent.connected";
		public static const DATA_LOADED:String = "DatabaseEvent.dataLoaded";
		
		public function DatabaseEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
		override public function clone():Event
		{
			return new DatabaseEvent(type, bubbles, cancelable);
		}
	}
}