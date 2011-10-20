package com.sunlightfoundation.decipherdc.app
{
	import com.google.maps.Alpha;
	import com.sunlightfoundation.decipherdc.model.events.*;
	import com.sunlightfoundation.decipherdc.view.*;
	
	import flash.events.Event;
	
	import org.robotlegs.mvcs.Mediator;
	
	import spark.components.Application;
	
	public class ApplicationMediator extends Mediator
	{
		[Inject]
		public var view:DecipherDC;
		
		override public function onRegister():void
		{
			trace("ApplicationMediator run");
			
			eventMap.mapListener(eventDispatcher, CharacterEvent.SHOW, handleCharacterShow);
//			eventMap.mapListener(eventDispatcher, CharacterViewEvent.ACTION_CLICK, handleActionClick);
		}
		
		public function handleCharacterShow(event:CharacterEvent):void
		{
			trace("handleCharacterShow event.characterView: " + event.character);
			var newView:CharacterView = new CharacterView();
			newView.data = event.character;
			view.addElement(newView);
			trace("Something happen here");
		}
	}
}