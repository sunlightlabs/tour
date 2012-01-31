package com.sunlightfoundation.decipherdc.model
{
	import com.sunlightfoundation.decipherdc.events.GameEvent;
	import com.sunlightfoundation.decipherdc.events.QuizEvent;
	import com.sunlightfoundation.decipherdc.model.events.ModelEvent;
	import com.sunlightfoundation.decipherdc.model.vo.Character;
	import com.sunlightfoundation.decipherdc.model.vo.CharacterState;
	
	import flash.utils.Dictionary;
	
	import mx.utils.StringUtil;
	
	public class GameConfig extends Object implements IGameConfig
	{	
		protected var _sourceCharacters:Vector.<Character>;
		protected var _sourceCharacterStates:Dictionary;
		protected var _loaded:Boolean;
		
		protected var _editor:Character;
		protected var _editorStates:Dictionary;
		
		
		public function GameConfig()
		{
			super();
			
			_sourceCharacters = generateSourceCharacters();
			_sourceCharacterStates = generateSouceCharacterStates();
			_editorStates = generateEditorStates();
			_loaded = true;
			
		}
		
		public function get loaded():Boolean
		{
			return _loaded;
		}
		
		public function get sourceCharacters():Vector.<Character>
		{
			return _sourceCharacters;
		}
		
		public function get editorCharacter():Character
		{
			if (_editor === null) {
				var editor:Character = new Character(
					'Editor in Chief',
					'assets/images/jjj.jpg'
				);
				_editor = editor;
			}

			return _editor;
		}
		
		public function editorCharacterState(state:String):CharacterState
		{
			if(_editorStates.hasOwnProperty(state))
			{
				return _editorStates[state]
			}
			return null;
		}
			
		private function generateEditorStates():Dictionary
		{
			var editorStates:Dictionary = new Dictionary(); 
			editorStates[GameEvent.INTRO_GAME] = new CharacterState(
				"Welcome to DC, kid. My name is Dingus MacElroy, and I'm going to show you the ropes",
				'Go on'
			);
			editorStates[GameEvent.NEW_MISSION] = new CharacterState(
				"I need you to uncover something about something! Go talk to one of my sources and see what you can dig up.",
				"Chase down a source"
			);			
			editorStates[GameEvent.MISSION_FAILED] = new CharacterState(
				"You failed to dig up what we needed for the story!",
				"Go home and rest up."
			);
			editorStates[GameEvent.MISSION_WON] = new CharacterState(
				"Good work, kid. You could make a career of it yet! Let's grab a sarsaparilla and I'll tell you about the dark underbelly of D.C.",
				"Have a sarsaparilla with the boss."
			);
			return editorStates;
		}
		
		public function sourceCharacterState(state:String):CharacterState
		{
			if(_sourceCharacterStates.hasOwnProperty(state))
			{
				return _sourceCharacterStates[state]
			}
			return null;
		}
		
		private function generateSouceCharacterStates():Dictionary
		{
			var states:Dictionary = new Dictionary();
			states[QuizEvent.ASK_QUESTION] = new CharacterState(
				"I ain't got time for your bullshit! Do you even know anything about how Washington works?",
				'Answer My Question'
			);
			states[QuizEvent.ANSWERED_INCORRECTLY] = new CharacterState(
				"Go back to Kansas, hayseed!",
				'Return to your boss'
			);
			states[QuizEvent.ANSWERED_CORRECTLY] = new CharacterState(
				"You know your stuff, perhaps.",
				"Return to Editor"
			);
			
			return states;
		}
		
		private function generateSourceCharacters():Vector.<Character>
		{
			var chars:Vector.<Character> = new Vector.<Character>();
			

			chars.push(new Character("Sally Source", "img/fakeImg.png"));
			chars.push(new Character("Pobodys Nerfect", "img/fakeImg.png"));
			chars.push(new Character("Sausage Biskit", "img/fakeImg.png"));
			chars.push(new Character("Little Timmy", "img/fakeImg.png"));
			
			return chars;
		}
	}
}