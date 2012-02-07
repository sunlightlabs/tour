package com.sunlightfoundation.decipherdc.controller
{
	import com.sunlightfoundation.decipherdc.events.QuizEvent;
	import com.sunlightfoundation.decipherdc.view.QuizView;
	
	import org.robotlegs.mvcs.Command;
	
	import spark.components.Application;
	import spark.components.ViewNavigatorApplication;
	
	public class ShowQuizViewCommand extends Command
	{
		
		[Inject]
		public var event:QuizEvent;
		
		override public function execute():void
		{
			var quizView:QuizView = new QuizView();
			quizView.data = event.quizItem;
			ViewNavigatorApplication(contextView).navigator.activeView.addElement(quizView);
		}
	}
}