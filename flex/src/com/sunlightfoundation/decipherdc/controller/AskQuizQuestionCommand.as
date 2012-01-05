package com.sunlightfoundation.decipherdc.controller
{
	import com.sunlightfoundation.decipherdc.events.QuizEvent;
	import com.sunlightfoundation.decipherdc.model.vo.QuizItem;
	
	import org.robotlegs.mvcs.Command;
	
	public class AskQuizQuestionCommand extends Command
	{
		override public function execute():void
		{
			trace("AskQuizQuestionCommand run");
			var quizQuestion:QuizItem = new QuizItem(
				"Who was the first president of the United States?",
				"George Washington",
				[
					"Ted Kord",
					"Dan Garret",
					"Jaime Reyes"
				]
			);
			
			dispatch(new QuizEvent(QuizEvent.SHOW, quizQuestion));
		}
	}
}