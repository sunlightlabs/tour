package com.sunlightfoundation.decipherdc.view
{
	import com.sunlightfoundation.decipherdc.events.QuizEvent;
	import com.sunlightfoundation.decipherdc.view.components.MultilineButton;
	import com.sunlightfoundation.decipherdc.view.events.ViewEvent;
	
	import flash.events.MouseEvent;
	
	import mx.events.FlexEvent;
	
	import org.robotlegs.mvcs.Mediator;
	
	import spark.effects.Fade;
	
	public class QuizViewMediator extends Mediator
	{
		[Inject]
		public var view:QuizView;
		
		override public function onRegister():void
		{
			trace("QuizView");
			addViewListener(QuizEvent.ANSWER_SELECTED, dispatch);
			addViewListener(ViewEvent.REMOVE, dispatch);
			
			var fadeOut:Fade = new Fade();
			fadeOut.alphaFrom = view.alpha;
			fadeOut.alphaTo = 0.0;
			
			view.setStyle("removedEffect", fadeOut);
		}
		
	}
}