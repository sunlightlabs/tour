package com.sunlightfoundation.decipherdc.controller.bootstrap
{
	import com.sunlightfoundation.decipherdc.controller.AskQuizQuestionCommand;
	import com.sunlightfoundation.decipherdc.model.events.QuizItemEvent;
	
	import org.robotlegs.mvcs.Command;
	
	public class BootstrapGameplayCommand extends Command
	{
		override public function execute():void
		{
			commandMap.mapEvent(QuizItemEvent.ASK_QUESTION, AskQuizQuestionCommand, QuizItemEvent);
		}
	}
}