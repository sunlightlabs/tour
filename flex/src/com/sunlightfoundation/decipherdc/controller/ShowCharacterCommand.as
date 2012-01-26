package com.sunlightfoundation.decipherdc.controller
{
	import com.sunlightfoundation.decipherdc.app.ApplicationContext;
	import com.sunlightfoundation.decipherdc.model.IGameState;
	import com.sunlightfoundation.decipherdc.view.CharacterView;
	
	import org.robotlegs.mvcs.Command;
	
	import spark.components.Application;
	
	public class ShowCharacterCommand extends Command
	{
		
		[Inject]
		public var gameState:IGameState;
		
		override public function execute():void
		{
			trace("ShowCharacterCommand");
			if (gameState.currentView) Application(contextView).removeElement(gameState.currentView);
			var characterView:CharacterView = new CharacterView();
			gameState.currentView = characterView;
			characterView.data = gameState.currentCharacter;
			Application(contextView).addElement(characterView);
		}
	}
}