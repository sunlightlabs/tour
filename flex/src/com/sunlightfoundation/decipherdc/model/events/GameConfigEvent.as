package com.sunlightfoundation.decipherdc.model.events
{
	import flash.events.Event;
	
	public class GameConfigEvent extends Event
	{
		public static const LOADED:String = "GameConfigEvent.loaded";
			
		public function GameConfigEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
		override public function clone():Event
		{
			return new GameConfigEvent(type, bubbles, cancelable);
		}
	}
}