package com.sunlightfoundation.decipherdc.controller
{
	import com.sunlightfoundation.decipherdc.app.ApplicationContext;
	import com.sunlightfoundation.decipherdc.events.GameEvent;
	import com.sunlightfoundation.decipherdc.model.IGameState;
	import com.sunlightfoundation.decipherdc.view.CharacterView;
	
	import mx.utils.StringUtil;
	
	import org.robotlegs.mvcs.Command;
	
	import spark.components.Application;
	import spark.components.ViewNavigator;
	import spark.components.ViewNavigatorApplication;
	
	public class ShowCharacterCommand extends Command
	{
		
		[Inject]
		public var event:GameEvent;
		
		[Inject]
		public var gameState:IGameState;
		
		override public function execute():void
		{
			trace("ShowCharacterCommand");
			
			var navigator:ViewNavigator = ViewNavigatorApplication(contextView).navigator;
			
			if (event.kwargs.hasOwnProperty('new') && event.kwargs['new'] === true)
			{
//				if (gameState.currentView) Application(contextView).navigator.popView(gameState.currentView);
//				gameState.currentView = new CharacterView();
				if (navigator.activeView !== null) {
					navigator.replaceView(CharacterView, gameState.currentCharacter);
				}
				else{
					navigator.pushView(CharacterView, gameState.currentCharacter);
				}
			}
			else
			{
				gameState.currentCharacter.updateDialogue(gameState.currentTask.category, gameState.currentTask.name ? gameState.currentTask.name : "Stuff");
//				currentView.data
				navigator.activeView.data = gameState.currentCharacter;
			}
//			var currentView:CharacterView = CharacterView(gameState.currentView);
//			currentView.data = gameState.currentCharacter;
		}
	}
}