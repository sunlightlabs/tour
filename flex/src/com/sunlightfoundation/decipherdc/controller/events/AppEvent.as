package com.sunlightfoundation.decipherdc.controller.events
{
	import flash.events.Event;
	
	public class AppEvent extends Event
	{
		public static const INITIALIZE:String = "AppEvent.initialize";
		
		
		public function AppEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
		override public function clone() : Event {
			return new AppEvent(type, bubbles, cancelable);
		}
	}
}