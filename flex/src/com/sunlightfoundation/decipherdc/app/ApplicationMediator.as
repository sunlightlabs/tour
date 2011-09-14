package com.sunlightfoundation.decipherdc.app
{
	import com.sunlightfoundation.decipherdc.events.*;
	import com.sunlightfoundation.decipherdc.view.*;
	
	import flash.events.Event;
	
	import org.robotlegs.mvcs.Mediator;
	
	import spark.components.ViewNavigator;
	import spark.components.ViewNavigatorApplication;
	
	public class ApplicationMediator extends Mediator
	{
		private var nav:ViewNavigator;
		
		override public function onRegister():void
		{
			trace("ApplicationMediator run");
			nav = ViewNavigatorApplication(contextView).navigator;
			nav.hideActionBar(false);
			
			eventMap.mapListener(eventDispatcher, CharacterViewEvent.SHOW, handleCharacterShow);

		}
		
		public function handleCharacterShow(event:CharacterViewEvent):void
		{
			trace("handleCharacterShow event.characterView: " + event.characterView);
			nav.addElement(event.characterView);
			trace("Something happen here");
		}
	}
}