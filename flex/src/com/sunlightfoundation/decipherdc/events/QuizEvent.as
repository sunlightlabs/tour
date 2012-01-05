package com.sunlightfoundation.decipherdc.events
{
	import com.sunlightfoundation.decipherdc.model.vo.QuizItem;
	
	import flash.events.Event;
	
	public class QuizEvent extends Event
	{
		public static const ASK_QUESTION:String = "QuizEvent.askQuestion";
		public static const SHOW:String = "QuizEvent.show";
		public static const HANDLE_RESPONSE:String = "QuizEvent.handleResponse";
		
		private var _quizItem:QuizItem;
		
		public function QuizEvent(type:String, quizItem:QuizItem=null, bubbles:Boolean=false, cancelable:Boolean=false)
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
			return new QuizEvent(type, quizItem, bubbles, cancelable);
		}
	}
}