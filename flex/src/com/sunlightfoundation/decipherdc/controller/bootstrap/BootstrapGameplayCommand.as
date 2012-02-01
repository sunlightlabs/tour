package com.sunlightfoundation.decipherdc.controller.bootstrap
{
	import com.sunlightfoundation.decipherdc.controller.*;
	import com.sunlightfoundation.decipherdc.events.GameEvent;
	import com.sunlightfoundation.decipherdc.events.QuizEvent;
	import com.sunlightfoundation.decipherdc.view.events.ViewEvent;
	
	import org.robotlegs.mvcs.Command;
	
	public class BootstrapGameplayCommand extends Command
	{
		override public function execute():void
		{
			commandMap.mapEvent(GameEvent.INTRO_GAME, IntroGameCommand, GameEvent, true);
			commandMap.mapEvent(GameEvent.NEW_MISSION, StartMissionCommand, GameEvent, false);
			commandMap.mapEvent(GameEvent.TRIGGER_ACTION, HandleActionClickCommand, GameEvent);
			commandMap.mapEvent(QuizEvent.SHOW, ShowQuizViewCommand, QuizEvent);
			commandMap.mapEvent(QuizEvent.ASK_QUESTION, AskQuizQuestionCommand, QuizEvent);
			commandMap.mapEvent(QuizEvent.ANSWER_SELECTED,  HandleQuizResponseCommand, QuizEvent);
			commandMap.mapEvent(GameEvent.SHOW_CHARACTER, ShowCharacterCommand, GameEvent);
//			Show source --> show sourcepicker
			commandMap.mapEvent(GameEvent.SOURCE_SELECTED, GoToSourceCommand, GameEvent);
			commandMap.mapEvent(GameEvent.SELECT_SOURCE, ShowSourcePickerCommand, GameEvent);
			commandMap.mapEvent(QuizEvent.ANSWERED_CORRECTLY, AnsweredCorrectlyCommand, QuizEvent);
			commandMap.mapEvent(QuizEvent.ANSWERED_INCORRECTLY, AnsweredIncorrectlyCommand, QuizEvent);
			commandMap.mapEvent(GameEvent.MISSION_WON, StartMissionCommand, GameEvent); // Really there is an intermediary step.
			commandMap.mapEvent(GameEvent.MISSION_FAILED, ShowFailureCommand, GameEvent); // Really there is an intermediary step.
		}
	}
}