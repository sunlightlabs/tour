package com.sunlightfoundation.decipherdc.view
{
	import flash.events.MouseEvent;
	import flash.events.TouchEvent;
	
	import mx.events.TouchInteractionEvent;
	
	import org.robotlegs.mvcs.Mediator;
	
	public class CharacterViewMediator extends Mediator
	{
		[Inject]
		public var view:CharacterView;
		
		private var actionLabel:String;
		
		override public function onRegister():void
		{
			eventMap.mapListener(view.characterAction, MouseEvent.CLICK, actionClickHandler);
			eventMap.mapListener(view.scrollArea, MouseEvent.MOUSE_DOWN, touchStartHandler);
			trace("CharacterViewMediator onRegister");
			actionLabel = view.characterAction.label;
		}
		
		public function actionClickHandler(event:MouseEvent):void
		{
			trace("actionClickHandler");
			trace("event: "+event);
			trace("event.target: "+event.target);
			trace("actionLabel: "+actionLabel);
		}
		
		public function touchStartHandler(event:MouseEvent):void
		{
			trace("touchStartHandler called");
			trace("view.dialogue.height: "+view.dialogue.height);
			trace("view.scrollArea.height: "+view.scrollArea.height);
			trace("view.scrollGroup.height: "+view.scrollGroup.height);
		}
	}
}