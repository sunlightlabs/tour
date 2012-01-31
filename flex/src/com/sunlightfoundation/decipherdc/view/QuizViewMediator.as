package com.sunlightfoundation.decipherdc.view
{
	import com.sunlightfoundation.decipherdc.events.QuizEvent;
	import com.sunlightfoundation.decipherdc.view.components.MultilineButton;
	import com.sunlightfoundation.decipherdc.view.effects.QuickFade;
	import com.sunlightfoundation.decipherdc.view.events.ViewEvent;
	
	import flash.events.MouseEvent;
	
	import mx.events.FlexEvent;
	
	import org.robotlegs.mvcs.Mediator;
		
	public class QuizViewMediator extends Mediator
	{
		[Inject]
		public var view:QuizView;
		
		override public function onRegister():void
		{
			addViewListener(QuizEvent.ANSWER_SELECTED, dispatch);
			addViewListener(ViewEvent.REMOVE, dispatch);
			
			var fadeOut:QuickFade = new QuickFade();
			fadeOut.alphaFrom = view.alpha;
			fadeOut.alphaTo = 0.0;
			
			view.setStyle("removedEffect", fadeOut);
		}
		
	}
}