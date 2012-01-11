package com.sunlightfoundation.decipherdc.view
{
	import com.sunlightfoundation.decipherdc.events.QuizEvent;
	import com.sunlightfoundation.decipherdc.model.events.CharacterEvent;
	import com.sunlightfoundation.decipherdc.view.events.ViewEvent;
	
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
			eventMap.mapListener(eventDispatcher, QuizEvent.INCORRECT, handleQuizIncorrect);
			eventMap.mapListener(eventDispatcher, QuizEvent.CORRECT, handleQuizCorrect);
			trace("CharacterViewMediator onRegister");
			
			var fadeOut:Fade = new Fade();
			fadeOut.alphaFrom = view.alpha;
			fadeOut.alphaTo = 0.0;
			
			view.setStyle("hideEffect", fadeOut);
		}
		
		public function actionClickHandler(event:MouseEvent):void
		{
			// Change to something that uses consts to define what types of actions a character might trigger
			dispatch(new QuizEvent(QuizEvent.ASK_QUESTION));
		}
		
		public function handleQuizIncorrect(event:QuizEvent):void
		{
			view.dialogue.text = "You got it wrong you dumb sonofabitch!";
		}
		
		public function handleQuizCorrect(event:QuizEvent):void
		{
			view.dialogue.text = "You are so beautiful to me!";
		}
		
	}
}