package com.sunlightfoundation.decipherdc.app
{
	import com.sunlightfoundation.decipherdc.events.QuizEvent;
	import com.sunlightfoundation.decipherdc.model.IGameState;
	import com.sunlightfoundation.decipherdc.model.events.*;
	import com.sunlightfoundation.decipherdc.model.vo.QuizItem;
	import com.sunlightfoundation.decipherdc.view.*;
	import com.sunlightfoundation.decipherdc.view.events.ViewEvent;
	
	import flash.events.Event;
	
	import org.robotlegs.mvcs.Mediator;
	
	import spark.components.Application;
	import spark.components.ViewNavigator;
	import spark.components.ViewNavigatorApplication;
	import spark.managers.PersistenceManager;
	import spark.transitions.CrossFadeViewTransition;
	
	public class ApplicationMediator extends Mediator
	{
		[Inject]
		public var view:DecipherDC;
		
		override public function onRegister():void
		{
			eventMap.mapListener(eventDispatcher, ViewEvent.REMOVE, removeView, ViewEvent);
			
//			var fadeTrans:CrossFadeViewTransition = new CrossFadeViewTransition();
//			view.navigator.defaultPushTransition = fadeTrans;
//			view.navigator.defaultPopTransition = fadeTrans;
		}
		
//		public function storeQuizItem(event:QuizEvent):void
//		{
//			trace("Store data");
//			var pm:PersistenceManager = new PersistenceManager();
//			pm.load();
//			pm.setProperty('quizItem', event.quizItem);			
//		}

		public function removeView(event:ViewEvent):void
		{
			var navigator:ViewNavigator = ViewNavigatorApplication(view).navigator;
//			view.navigator.popView();
			
			navigator.activeView.removeElement(event.view);
//			trace("removeView and something: " + gameState.currentTaskId);
			
		}
	}
}