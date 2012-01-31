package com.sunlightfoundation.decipherdc.view
{
	import com.sunlightfoundation.decipherdc.events.GameEvent;
	
	import flash.events.MouseEvent;
	import flash.events.TouchEvent;
	
	import mx.effects.Effect;
	import mx.events.TouchInteractionEvent;
	
	import org.robotlegs.mvcs.Mediator;
	
	import spark.effects.Fade;
	
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
			trace("actionClick!");
			// Change to something that uses consts to define what types of actions a character might trigger
			dispatch(new GameEvent(GameEvent.TRIGGER_ACTION));
		}
		
	}
}