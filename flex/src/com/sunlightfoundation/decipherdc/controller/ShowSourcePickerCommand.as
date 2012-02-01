package com.sunlightfoundation.decipherdc.controller
{
	import com.sunlightfoundation.decipherdc.events.GameEvent;
	import com.sunlightfoundation.decipherdc.events.QuizEvent;
	import com.sunlightfoundation.decipherdc.model.IGameConfig;
	import com.sunlightfoundation.decipherdc.model.IGameState;
	import com.sunlightfoundation.decipherdc.model.vo.Character;
	import com.sunlightfoundation.decipherdc.view.SourcePickerView;
	
	import mx.collections.ArrayCollection;
	
	import org.robotlegs.mvcs.Command;
	
	import spark.components.Application;
	
	public class ShowSourcePickerCommand extends Command
	{
		[Inject]
		public var gameConfig:IGameConfig;
		
		[Inject]
		public var gameState:IGameState;

		override public function execute():void
		{
			trace("ShowSourcePickerCommand");
//			var sources:ArrayCollection = gameConfig.sourceCharacters;
			
			gameState.nextPhase = new GameEvent(GameEvent.SHOW_CHARACTER);
//			sources[0].state = gameConfig.sourceCharacterState(gameState.nextPhase.type);
//			gameState.currentCharacter = sources[0];

			var sourcePickerView:SourcePickerView = new SourcePickerView();
			sourcePickerView.data = gameConfig.sourceCharacters;
			Application(contextView).addElement(sourcePickerView);

			
//			dispatch(new GameEvent(GameEvent.SHOW_CHARACTER));
		}
	}
}