package com.sunlightfoundation.decipherdc.controller
{
	import com.sunlightfoundation.decipherdc.controller.events.AppEvent;
	import com.sunlightfoundation.decipherdc.events.GameEvent;
	import com.sunlightfoundation.decipherdc.events.QuizEvent;
	import com.sunlightfoundation.decipherdc.model.GameState;
	import com.sunlightfoundation.decipherdc.model.IGameConfig;
	import com.sunlightfoundation.decipherdc.model.IGameState;
	import com.sunlightfoundation.decipherdc.model.vo.Character;
	import com.sunlightfoundation.decipherdc.model.vo.QuizItem;
	import com.sunlightfoundation.decipherdc.view.CharacterView;
	
	import org.robotlegs.mvcs.Command;
	
	public class HandleQuizResponseCommand extends Command
	{
		[Inject]
		public var event:QuizEvent;
		
		[Inject]
		public var gameConfig:IGameConfig;
		
		[Inject]
		public var gameState:IGameState;
		
		override public function execute():void
		{
			trace("HandleQuizResponseCommand run");
			if(event.quizItem.selected === event.quizItem.answer)
			{
				gameState.nextPhase = new QuizEvent(QuizEvent.ANSWERED_CORRECTLY);
				gameState.currentCharacter.state = gameConfig.sourceCharacterState(QuizEvent.ANSWERED_CORRECTLY);
				CharacterView(gameState.currentView).data = gameState.currentCharacter
			}
			else
			{

				gameState.nextPhase = new QuizEvent(QuizEvent.ANSWERED_INCORRECTLY);
				gameState.currentCharacter.state = gameConfig.sourceCharacterState(QuizEvent.ANSWERED_INCORRECTLY);
				CharacterView(gameState.currentView).data = gameState.currentCharacter
			}
			gameState.advanceTask();
		}
	}
}