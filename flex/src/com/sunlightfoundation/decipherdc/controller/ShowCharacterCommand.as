package com.sunlightfoundation.decipherdc.controller
{
	import com.sunlightfoundation.decipherdc.app.ApplicationContext;
	import com.sunlightfoundation.decipherdc.events.GameEvent;
	import com.sunlightfoundation.decipherdc.model.IGameState;
	import com.sunlightfoundation.decipherdc.view.CharacterView;
	
	import org.robotlegs.mvcs.Command;
	
	import spark.components.Application;
	
	import mx.utils.StringUtil;
	
	public class ShowCharacterCommand extends Command
	{
		
		[Inject]
		public var event:GameEvent;
		
		[Inject]
		public var gameState:IGameState;
		
		override public function execute():void
		{
			trace("ShowCharacterCommand");
			
			if (event.kwargs.hasOwnProperty('new') && event.kwargs['new'] === true)
			{
				if (gameState.currentView) Application(contextView).removeElement(gameState.currentView);
				gameState.currentView = new CharacterView();
			}
			else if (gameState.currentView === null )
			{
				gameState.currentView = new CharacterView();
			}
			var currentView:CharacterView = CharacterView(gameState.currentView);
			gameState.currentCharacter.updateDialogue(gameState.currentTask.category, gameState.currentTask.name ? gameState.currentTask.name : "Stuff");
			currentView.data = gameState.currentCharacter;
			Application(contextView).addElement(currentView);
		}
	}
}