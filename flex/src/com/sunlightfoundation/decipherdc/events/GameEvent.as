package com.sunlightfoundation.decipherdc.events
{
	import flash.events.Event;
	
	public class GameEvent extends Event
	{
		public static const INTRO_GAME:String = "gameEvent.introGame";
		public static const NEW_MISSION:String = "gameEvent.newMission";
		public static const GO_TO_SOURCE:String = "gameEvent.goToSource";
		public static const TRIGGER_ACTION:String = "gameEvent.triggerAction";
		public static const SHOW_CHARACTER:String = "gameEvent.showCharacter";
		public static const MISSION_WON:String = "gameEvent.missionWon";
		public static const MISSION_FAILED:String = "gameEvent.missionFailed";
		
		private var _kwargs:Object;
		
		public function GameEvent(type:String, kwargs:Object=null, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			_kwargs = kwargs !== null ? kwargs : new Object();
			super(type, bubbles, cancelable);
		}
		
		override public function clone():Event
		{
			return new GameEvent(type, bubbles, cancelable);
		}
		
		public function get kwargs():Object
		{
			return _kwargs;
		}

	}
}