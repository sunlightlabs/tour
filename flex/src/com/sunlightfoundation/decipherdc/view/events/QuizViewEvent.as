package com.sunlightfoundation.decipherdc.view.events
{
	import flash.events.Event;
	
	public class QuizViewEvent extends Event
	{
		public static const BUTTON_CLICK:String = "buttonClick";

		public function QuizViewEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}