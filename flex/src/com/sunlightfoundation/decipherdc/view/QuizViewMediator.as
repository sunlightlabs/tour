package com.sunlightfoundation.decipherdc.view
{
	import com.sunlightfoundation.decipherdc.events.QuizEvent;
	import com.sunlightfoundation.decipherdc.model.vo.QuizItem;
	import com.sunlightfoundation.decipherdc.view.events.ViewEvent;
		
	import org.robotlegs.mvcs.Mediator;
		
	public class QuizViewMediator extends Mediator
	{
		[Inject]
		public var quizView:QuizView;
		
		override public function onRegister():void
		{
			eventMap.mapListener(quizView, ViewEvent.TARGET_CLICK, onQuizViewClick);			
		}
		
		private function onQuizViewClick(event:ViewEvent):void
		{
			dispatch(new QuizEvent( QuizEvent.ANSWER_SELECTED, QuizItem(quizView.data) ));
			dispatch(new ViewEvent( ViewEvent.REMOVE, quizView));

		}
		
	}
}