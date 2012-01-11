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
		
		// Daniel is the best!
		override public function execute():void
		{
			trace("HandleQuizResponseCommand run");
			trace("Question: " + event.quizItem.question);
			trace("Response: " + event.quizItem.selected);
			trace("Answer: " + event.quizItem.answer);
			if(event.quizItem.selected === event.quizItem.answer)
			{
				dispatch(new QuizEvent(QuizEvent.CORRECT));

			}
			else
			{
				dispatch(new QuizEvent(QuizEvent.INCORRECT));
			}
//			Go to next task in the sequence?
		}
	}
}