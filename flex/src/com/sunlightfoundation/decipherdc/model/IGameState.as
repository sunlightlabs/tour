package com.sunlightfoundation.decipherdc.model
{
	import com.sunlightfoundation.decipherdc.events.GameEvent;
	import com.sunlightfoundation.decipherdc.model.vo.Character;
	import com.sunlightfoundation.decipherdc.model.vo.Location;
	import com.sunlightfoundation.decipherdc.model.vo.QuizItem;
	
	import flash.events.Event;
	
	import mx.core.UIComponent;

	public interface IGameState
	{
		function get currentTaskId():int;
		function set currentTaskId(value:int):void;
		
		function get taskSequence():Vector.<Location>;
		function set taskSequence(value:Vector.<Location>):void;
		
		function get currentView():UIComponent;
		function set currentView(view:UIComponent):void;
		
		function get currentCharacter():Character;
		function set currentCharacter(character:Character):void;
		
		function get currentQuizItem():QuizItem;
		function set currentQuizItem(quizItem:QuizItem):void;
		
		function get nextPhase():Event;
		function set nextPhase(phaseEvent:Event):void;

	}
}