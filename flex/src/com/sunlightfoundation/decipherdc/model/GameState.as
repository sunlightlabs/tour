package com.sunlightfoundation.decipherdc.model
{
	import com.sunlightfoundation.decipherdc.model.vo.Character;
	import com.sunlightfoundation.decipherdc.model.vo.Location;
	import com.sunlightfoundation.decipherdc.model.vo.QuizItem;
	
	import mx.core.UIComponent;
	
	import org.robotlegs.mvcs.Actor;
	
	public class GameState extends Actor implements IGameState
	{
		protected var _taskSequence:Vector.<Location>;
		protected var _currentView:UIComponent = null;
		protected var _currentCharacter:Character = null;
		protected var _currentQuizItem:QuizItem;
		
		public function GameState()
		{
			super();
		}
		
		// TODO make retrieval of a task easy, either by ID or returning a task item. Does GameStateModel control/track what task we are on?
		public function get currentTaskId():int
		{
			return 0;
		}
		
		public function set currentTaskId(value:int):void
		{
		}
		
		public function get taskSequence():Vector.<Location>
		{
			return _taskSequence;
		}
		
		public function set taskSequence(value:Vector.<Location>):void
		{
			_taskSequence = value;
		}
		
		public function get currentView():UIComponent
		{
			return _currentView;
		}
		
		public function set currentView(view:UIComponent):void
		{
			_currentView = view;
		}
		
		public function get currentCharacter():Character
		{
			return _currentCharacter;
		}
		
		public function set currentCharacter(character:Character):void
		{
			_currentCharacter = character;
		}
		
		public function get currentQuizItem():QuizItem
		{
			return _currentQuizItem;
		}
		
		public function set currentQuizItem(quizItem:QuizItem):void
		{
			_currentQuizItem = quizItem;
		}
	}
}