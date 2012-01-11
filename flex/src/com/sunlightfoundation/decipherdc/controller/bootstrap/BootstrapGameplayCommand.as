package com.sunlightfoundation.decipherdc.controller.bootstrap
{
	import com.sunlightfoundation.decipherdc.controller.AskQuizQuestionCommand;
	import com.sunlightfoundation.decipherdc.controller.HandleQuizResponseCommand;
	import com.sunlightfoundation.decipherdc.events.QuizEvent;
	import com.sunlightfoundation.decipherdc.view.events.ViewEvent;
		
	import org.robotlegs.mvcs.Command;
	
	public class BootstrapGameplayCommand extends Command
	{
		override public function execute():void
		{
			commandMap.mapEvent(QuizEvent.ASK_QUESTION, AskQuizQuestionCommand, QuizEvent);
			commandMap.mapEvent(QuizEvent.ANSWER_SELECTED,  HandleQuizResponseCommand, QuizEvent);
		}
	}
}