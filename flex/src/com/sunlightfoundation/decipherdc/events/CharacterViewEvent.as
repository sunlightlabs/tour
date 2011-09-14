package com.sunlightfoundation.decipherdc.events
{
	import com.sunlightfoundation.decipherdc.view.CharacterView;
	
	import flash.events.Event;
	
	public class CharacterViewEvent extends Event
	{
		public static const SHOW:String = "showCharacterView";
		
		private var _characterView:CharacterView;
		
		public function CharacterViewEvent(type:String, characterView:CharacterView, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			_characterView = characterView;
		}
		
		public function get characterView():CharacterView 
		{
			
			return _characterView;
		}
		
		override public function clone():Event
		{
			return new CharacterViewEvent(type, characterView, bubbles, cancelable);
		}
	}
}