package com.sunlightfoundation.decipherdc.controller.bootstrap
{
	import com.sunlightfoundation.decipherdc.controller.AskQuizQuestionCommand;
	import com.sunlightfoundation.decipherdc.controller.HandleQuizResponseCommand;
	import com.sunlightfoundation.decipherdc.events.QuizEvent;
	
	import org.robotlegs.mvcs.Command;
	
	public class BootstrapGameplayCommand extends Command
	{
		override public function execute():void
		{
			commandMap.mapEvent(com.sunlightfoundation.decipherdc.events.QuizEvent.ASK_QUESTION, AskQuizQuestionCommand, com.sunlightfoundation.decipherdc.events.QuizEvent);
			commandMap.mapEvent(QuizEvent.HANDLE_RESPONSE,  HandleQuizResponseCommand, QuizEvent);
		}
	}
}