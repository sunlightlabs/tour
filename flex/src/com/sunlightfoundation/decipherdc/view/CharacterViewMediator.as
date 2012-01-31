package com.sunlightfoundation.decipherdc.view
{
	import com.sunlightfoundation.decipherdc.events.GameEvent;
	import com.sunlightfoundation.decipherdc.view.effects.QuickFade;
	
	import flash.events.MouseEvent;
	import flash.events.TouchEvent;
	
	import mx.effects.Effect;
	import mx.events.TouchInteractionEvent;
	
	import org.robotlegs.mvcs.Mediator;
		
	public class CharacterViewMediator extends Mediator
	{
		[Inject]
		public var view:CharacterView;
				
		override public function onRegister():void
		{
			eventMap.mapListener(view.characterAction, MouseEvent.CLICK, actionClickHandler);
			
			var fadeOut:QuickFade = new QuickFade();
			fadeOut.alphaFrom = view.alpha;
			fadeOut.alphaTo = 0.0;
			
			view.setStyle("hideEffect", fadeOut);
		}
		
		public function actionClickHandler(event:MouseEvent):void
		{
			dispatch(new GameEvent(GameEvent.TRIGGER_ACTION));
		}
		
	}
}