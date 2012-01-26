package com.sunlightfoundation.decipherdc.controller
{
	import com.sunlightfoundation.decipherdc.app.ApplicationContext;
	import com.sunlightfoundation.decipherdc.model.IGameStateModel;
	import com.sunlightfoundation.decipherdc.model.events.CharacterEvent;
	import com.sunlightfoundation.decipherdc.view.CharacterView;
	
	import org.robotlegs.mvcs.Command;
	
	import spark.components.Application;
	
	public class ShowCharacterCommand extends Command
	{
		[Inject]
		public var event:CharacterEvent;
		
		[Inject]
		public var gameStateModel:IGameStateModel;
		
		override public function execute():void
		{
			trace("ShowCharacterCommand");
			var characterView:CharacterView = new CharacterView();
			gameStateModel.currentView = characterView;
			characterView.data = gameStateModel.currentCharacter;
			Application(contextView).addElement(characterView);
		}
	}
}