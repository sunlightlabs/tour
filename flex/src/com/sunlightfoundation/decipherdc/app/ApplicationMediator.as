package com.sunlightfoundation.decipherdc.app
{
	import com.google.maps.Alpha;
	import com.sunlightfoundation.decipherdc.events.QuizEvent;
	import com.sunlightfoundation.decipherdc.model.GameStateModel;
	import com.sunlightfoundation.decipherdc.model.IGameStateModel;
	import com.sunlightfoundation.decipherdc.model.events.*;
	import com.sunlightfoundation.decipherdc.model.vo.QuizItem;
	import com.sunlightfoundation.decipherdc.view.*;
	import com.sunlightfoundation.decipherdc.view.events.ViewEvent;
	
	import flash.events.Event;
	
	import org.robotlegs.mvcs.Mediator;
	
	import spark.components.Application;
	import spark.managers.PersistenceManager;
	
	public class ApplicationMediator extends Mediator
	{
		[Inject]
		public var view:DecipherDC;
		
		private var gameState:IGameStateModel;
		
		override public function onRegister():void
		{
			trace("ApplicationMediator run");
			
			eventMap.mapListener(eventDispatcher, CharacterEvent.SHOW, handleCharacterShow, CharacterEvent);
			eventMap.mapListener(eventDispatcher, QuizEvent.SHOW, handleQuizItemShow, QuizEvent);
			eventMap.mapListener(eventDispatcher, QuizEvent.SHOW, storeQuizItem, QuizEvent);
			eventMap.mapListener(eventDispatcher, ViewEvent.REMOVE, removeView, ViewEvent);
		}
		
		// Change to showView command listener thingy
		public function handleCharacterShow(event:CharacterEvent):void
		{
			trace("handleCharacterShow event.characterView: " + event.character);
			var characterView:CharacterView = new CharacterView();
			characterView.data = event.character;
			view.addElement(characterView);
			trace("Something happen here");
		}

		
		public function handleQuizItemShow(event:QuizEvent):void
		{
			trace("handleQuizItemShow event.quizItem: " + event.quizItem);
			var quizView:QuizView = new QuizView();
			quizView.data = event.quizItem;
			view.addElement(quizView);
		}
		
		public function storeQuizItem(event:QuizEvent):void
		{
			trace("Store data");
			var pm:PersistenceManager = new PersistenceManager();
			pm.load();
			pm.setProperty('quizItem', event.quizItem);			
		}

		public function removeView(event:ViewEvent):void
		{
			view.removeElement(event.view);
			gameState = new GameStateModel();

			trace("removeView and something: " + gameState.currentTaskId);
			
		}
	}
}