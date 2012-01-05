package com.sunlightfoundation.decipherdc.app
{
	import com.google.maps.Alpha;
	import com.sunlightfoundation.decipherdc.model.events.*;
	import com.sunlightfoundation.decipherdc.events.QuizEvent;
	import com.sunlightfoundation.decipherdc.model.vo.QuizItem;
	import com.sunlightfoundation.decipherdc.view.*;
	import com.sunlightfoundation.decipherdc.view.events.QuizViewEvent;
	
	import flash.events.Event;
	
	import org.robotlegs.mvcs.Mediator;
	
	import spark.components.Application;
	import spark.managers.PersistenceManager;
	
	public class ApplicationMediator extends Mediator
	{
		[Inject]
		public var view:DecipherDC;
		
		override public function onRegister():void
		{
			trace("ApplicationMediator run");
			
			eventMap.mapListener(eventDispatcher, CharacterEvent.SHOW, handleCharacterShow, CharacterEvent);
			eventMap.mapListener(eventDispatcher, QuizEvent.SHOW, handleQuizItemShow, QuizEvent);
			eventMap.mapListener(eventDispatcher, QuizEvent.SHOW, storeQuizItem, QuizEvent);
			eventMap.mapListener(eventDispatcher, CharacterEvent.ACTION_CLICK, handleActionClick);
			eventMap.mapListener(eventDispatcher, QuizViewEvent.BUTTON_CLICK, handleQuizClick, QuizViewEvent);
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

		public function handleActionClick(event:CharacterEvent):void
		{
//			dispatch(new QuizViewEvent(QuizViewEvent.BUTTON_CLICK));
			var quizView:QuizView = new QuizView();
			view.addElement(quizView);
		}
		
		public function handleQuizClick(event:QuizViewEvent):void
		{
			trace("handleQuizClick: " + event.labelText);
//			trace(event.labelText);
		}
	}
}