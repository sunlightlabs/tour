package com.sunlightfoundation.decipherdc.view
{
	import com.sunlightfoundation.decipherdc.view.components.MultilineButton;
	
	import flash.events.MouseEvent;
	
	import mx.events.FlexEvent;
	
	import org.robotlegs.mvcs.Mediator;
	
	public class QuizViewMediator extends Mediator
	{
		[Inject]
		public var view:QuizView;
		
		override public function onRegister():void
		{
			trace("QuizView");
			trace(view.data);
			eventMap.mapListener(view, MouseEvent.CLICK, handleQuizClick);
		}
		
		public function handleQuizClick(event:MouseEvent):void
		{
			trace("event.target: " + (event.target is MultilineButton));
			if(event.target is MultilineButton)
			{
//				dispatch(MultilineButtonEvent
			}
		}
	}
}