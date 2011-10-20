package com.sunlightfoundation.decipherdc.model.events
{
	import com.sunlightfoundation.decipherdc.model.vo.QuizItem;
	
	import flash.events.Event;
	
	public class QuizItemEvent extends Event
	{
		public static const ASK_QUESTION:String = "QuizEvent.askQuestion";
		public static const SHOW:String = "QuizEvent.show";
		
		private var _quizItem:QuizItem;
		
		public function QuizItemEvent(type:String, quizItem:QuizItem=null, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			_quizItem = quizItem;
		}
		
		public function get quizItem():QuizItem
		{
			return _quizItem;
		}
		
		override public function clone():Event
		{
			return new QuizItemEvent(type, quizItem, bubbles, cancelable);
		}
	}
}