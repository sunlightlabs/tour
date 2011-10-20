package com.sunlightfoundation.decipherdc.view
{
	import com.sunlightfoundation.decipherdc.model.events.CharacterEvent;
	
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
		
//		private var actionLabel:String;
		
		override public function onRegister():void
		{
			eventMap.mapListener(view.characterAction, MouseEvent.CLICK, actionClickHandler);
			trace("CharacterViewMediator onRegister");
//			actionLabel = view.characterAction.label;
			
			var fadeOut:Fade = new Fade();
			fadeOut.alphaFrom = view.alpha;
			fadeOut.alphaTo = 0.0;
			
			view.setStyle("hideEffect", fadeOut);
		}
		
		public function actionClickHandler(event:MouseEvent):void
		{
			trace("actionClickHandler");
			trace("event: "+event);
			trace("event.target: "+event.target);
//			trace("actionLabel: "+actionLabel);
//			dispatch(new CharacterEvent(CharacterEvent.ACTION_CLICK, view.data));
		}
		
	}
}