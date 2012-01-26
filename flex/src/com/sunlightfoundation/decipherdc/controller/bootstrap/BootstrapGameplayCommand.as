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
			commandMap.mapEvent(GameEvent.TRIGGER_ACTION, HandleActionClickCommand, GameEvent);
			commandMap.mapEvent(QuizEvent.ASK_QUESTION, AskQuizQuestionCommand, QuizEvent);
			commandMap.mapEvent(QuizEvent.ANSWER_SELECTED,  HandleQuizResponseCommand, QuizEvent);
			commandMap.mapEvent(GameEvent.SHOW_CHARACTER, ShowCharacterCommand, GameEvent);
			commandMap.mapEvent(GameEvent.GO_TO_SOURCE, GoToSourceCommand, GameEvent);
			commandMap.mapEvent(GameEvent.MISSION_SUCCESS, StartMissionCommand, GameEvent); // Really there is an intermediary step.
		}
	}
}