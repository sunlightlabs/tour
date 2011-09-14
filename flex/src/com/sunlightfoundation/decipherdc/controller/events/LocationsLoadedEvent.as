package com.sunlightfoundation.decipherdc.controller.events
{
	import flash.events.Event;
	
	public class LocationsLoadedEvent extends Event
	{
		public static const LOADED:String = "LocationsLoadedEvent";
		
		public function LocationsLoadedEvent(bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(LOADED, bubbles, cancelable);
		}
		
		override public function clone():Event
		{
			return new LocationsLoadedEvent(bubbles, cancelable);
		}
	}
}