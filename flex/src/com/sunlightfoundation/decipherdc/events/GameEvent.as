package com.sunlightfoundation.decipherdc.events
{
	import flash.events.Event;
	
	public class GameEvent extends Event
	{
		public static const GO_TO_SOURCE:String = "gameEvent.goToSource";
		public static const TRIGGER_ACTION:String = "gameEvent.triggerAction";
		public static const SHOW_CHARACTER:String = "gameEvent.showCharacter";
		public static const MISSION_SUCCESS:String = "gameEvent.missionSuccess";
		
		public function GameEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
		override public function clone():Event
		{
			return new GameEvent(type, bubbles, cancelable);
		}

	}
}