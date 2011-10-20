package com.sunlightfoundation.decipherdc.model.events
{
	import com.sunlightfoundation.decipherdc.model.vo.Character;
	
	import flash.events.Event;
	
	public class CharacterEvent extends Event
	{
		public static const SHOW:String = "showCharacterView";
		public static const ACTION_CLICK:String = "actionClick";
		
		protected var _character:Character;
		
		public function CharacterEvent(type:String, character:Character, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			_character= character;
		}
		
		public function get character():Character
		{
			
			return _character;
		}
		
		override public function clone():Event
		{
			return new CharacterEvent(type, character, bubbles, cancelable);
		}
	}
}