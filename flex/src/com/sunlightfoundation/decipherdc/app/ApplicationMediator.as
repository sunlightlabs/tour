package com.sunlightfoundation.decipherdc.app
{
	import com.google.maps.Alpha;
	import com.sunlightfoundation.decipherdc.model.events.*;
	import com.sunlightfoundation.decipherdc.view.*;
	import com.sunlightfoundation.decipherdc.view.events.QuizViewEvent;
	
	import flash.events.Event;
	
	import org.robotlegs.mvcs.Mediator;
	
	import spark.components.Application;
	
	public class ApplicationMediator extends Mediator
	{
		[Inject]
		public var view:DecipherDC;
		
		override public function onRegister():void
		{
			trace("ApplicationMediator run");
			
			eventMap.mapListener(eventDispatcher, CharacterEvent.SHOW, handleCharacterShow, CharacterEvent);
			eventMap.mapListener(eventDispatcher, QuizItemEvent.SHOW, handleQuizItemShow, QuizItemEvent);
			eventMap.mapListener(eventDispatcher, CharacterEvent.ACTION_CLICK, handleActionClick);
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

		
		public function handleQuizItemShow(event:QuizItemEvent):void
		{
			trace("handleCharacterShow event.quizItem: " + event.quizItem);
			var quizView:QuizView = new QuizView();
			quizView.data = event.quizItem;
			view.addElement(quizView);
		}

		public function handleActionClick(event:CharacterEvent):void
		{
//			dispatch(new QuizViewEvent(QuizViewEvent.BUTTON_CLICK));
			var quizView:QuizView = new QuizView();
			view.addElement(quizView);
		}
	}
}