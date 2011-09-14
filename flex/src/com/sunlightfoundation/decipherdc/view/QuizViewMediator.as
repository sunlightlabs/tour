package com.sunlightfoundation.decipherdc.view
{
	import org.robotlegs.mvcs.Mediator;
	
	public class QuizViewMediator extends Mediator
	{
		[Inject]
		public var view:QuizView;
		
		override public function onRegister():void
		{
			trace("QuizView");
//			trace(view.answersGroup);
		}
	}
}