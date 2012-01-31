package com.sunlightfoundation.decipherdc.controller
{
	import com.sunlightfoundation.decipherdc.events.GameEvent;
	import com.sunlightfoundation.decipherdc.events.QuizEvent;
	import com.sunlightfoundation.decipherdc.model.IGameConfig;
	import com.sunlightfoundation.decipherdc.model.IGameState;
	import com.sunlightfoundation.decipherdc.model.vo.Character;
	
	import org.robotlegs.mvcs.Command;
	
	public class AnsweredIncorrectlyCommand extends Command
	{
		
		[Inject]
		public var event:QuizEvent;
		
		[Inject]
		public var gameConfig:IGameConfig;
		
		[Inject]
		public var gameState:IGameState;
		
		override public function execute():void
		{
//			var editor:Character = gameConfig.editorCharacter;
//			gameState.nextPhase = new GameEvent(GameEvent.NEW_MISSION);
//			editor.setState( gameConfig.editorCharacterState(gameState.nextPhase.type) );
//			gameState.currentCharacter = editor;
			
			dispatch(new GameEvent(GameEvent.NEW_MISSION));
		}
	}
}