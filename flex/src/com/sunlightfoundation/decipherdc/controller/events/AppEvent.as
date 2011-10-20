package com.sunlightfoundation.decipherdc.controller.events
{
	import flash.events.Event;
	
	public class AppEvent extends Event
	{
		public static const INITIALIZE:String = "AppEvent.initialize";
		public static const NEW_MISSION:String = "AppEvent.newMission";
		public static const READY:String = "AppEvent.ready";
		public static const LOADED:String = "AppEvent.loaded";
		
		
		public function AppEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
		override public function clone() : Event {
			return new AppEvent(type, bubbles, cancelable);
		}
	}
}