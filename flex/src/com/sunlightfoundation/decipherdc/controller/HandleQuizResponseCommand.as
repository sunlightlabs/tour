package com.sunlightfoundation.decipherdc.controller
{
	import com.sunlightfoundation.decipherdc.events.QuizEvent;
	import com.sunlightfoundation.decipherdc.controller.events.AppEvent;
	import com.sunlightfoundation.decipherdc.model.vo.QuizItem;
	
	import org.robotlegs.mvcs.Command;
	
	public class HandleQuizResponseCommand extends Command
	{
		[Inject]
		public var event:QuizEvent;
		
		[Inject]
		public var gameState:IGameState;
		
		override public function execute():void
		{
			trace("HandleQuizResponseCommand run");
			if(event.quizItem.selected === event.quizItem.answer)
			{
				gameState.currentCharacter.state = Character.MISSION_SUCCESS;
				CharacterView(gameState.currentView).data = gameState.currentCharacter
				dispatch(new QuizEvent(QuizEvent.CORRECT));
			}
			else
			{
				gameState.currentCharacter.state = Character.MISSION_FAIL;
				CharacterView(gameState.currentView).data = gameState.currentCharacter
				dispatch(new QuizEvent(QuizEvent.INCORRECT));
			}
//			Go to next task in the sequence?
		}
	}
}