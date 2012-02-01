package com.sunlightfoundation.decipherdc.controller
{
	import com.sunlightfoundation.decipherdc.events.GameEvent;
	import com.sunlightfoundation.decipherdc.events.QuizEvent;
	import com.sunlightfoundation.decipherdc.model.IGameConfig;
	import com.sunlightfoundation.decipherdc.model.IGameState;
	import com.sunlightfoundation.decipherdc.model.vo.Character;
	
	import mx.collections.ArrayCollection;
	
	import org.robotlegs.mvcs.Command;
	
	public class GoToSourceCommand extends Command
	{
		[Inject]
		public var gameConfig:IGameConfig;
		
		[Inject]
		public var gameState:IGameState;
		
		[Inject]
		public var event:GameEvent;
		
		private var _sourceCharacter:Character;
		
		override public function execute():void
		{
			trace("GoToSourceCommand");

			gameState.nextPhase = new QuizEvent(QuizEvent.ASK_QUESTION);
			
			if (event.kwargs.hasOwnProperty('sourceName'))
			{
				var selectedName:String = event.kwargs['sourceName'];
				for (var n:int = 0, len:int = gameConfig.sourceCharacters.length; n < len; n++) 
				{
					if (gameConfig.sourceCharacters[n].name === selectedName) 
					{
						_sourceCharacter = gameConfig.sourceCharacters[n];
						break;
					}
				}
				
			}
			else{
				_sourceCharacter = gameConfig.sourceCharacters[0];
			}
			_sourceCharacter.state = gameConfig.sourceCharacterState(gameState.nextPhase.type);
			
			
			gameState.currentCharacter = _sourceCharacter;
			
			dispatch(new GameEvent(GameEvent.SHOW_CHARACTER));
		}
	}
}