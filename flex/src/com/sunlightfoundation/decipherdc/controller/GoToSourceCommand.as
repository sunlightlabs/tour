package com.sunlightfoundation.decipherdc.controller
{
	import com.sunlightfoundation.decipherdc.events.GameEvent;
	import com.sunlightfoundation.decipherdc.events.QuizEvent;
	import com.sunlightfoundation.decipherdc.model.IGameConfig;
	import com.sunlightfoundation.decipherdc.model.IGameState;
	import com.sunlightfoundation.decipherdc.model.vo.Character;
	
	import org.robotlegs.mvcs.Command;
	
	public class GoToSourceCommand extends Command
	{
		[Inject]
		public var gameConfig:IGameConfig;
		
		[Inject]
		public var gameState:IGameState;
		
		override public function execute():void
		{
			trace("GoToSourceCommand");
//			Should load a source picker menu, but for now we go to a random source
			var sources:Vector.<Character> = gameConfig.sourceCharacters;
			
			gameState.nextPhase = new QuizEvent(QuizEvent.ASK_QUESTION);
			sources[0].state = gameConfig.sourceCharacterState(gameState.nextPhase.type);
			gameState.currentCharacter = sources[0];
			
			dispatch(new GameEvent(GameEvent.SHOW_CHARACTER));
		}
	}
}