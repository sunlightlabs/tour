package com.sunlightfoundation.decipherdc.model
{
	import com.sunlightfoundation.decipherdc.events.GameEvent;
	import com.sunlightfoundation.decipherdc.model.events.ModelEvent;
	import com.sunlightfoundation.decipherdc.model.vo.Character;
	import com.sunlightfoundation.decipherdc.model.vo.CharacterState;
	
	import flash.utils.Dictionary;
	
	import mx.utils.StringUtil;
	
	public class GameConfig extends Object implements IGameConfig
	{	
		protected var _sourceCharacters:Vector.<Character>;
		protected var _loaded:Boolean;
		
		protected var _editor:Character;
		protected var _editorActions:Dictionary;
		
		
		public function GameConfig()
		{
			super();
			
			_sourceCharacters = generateSourceCharacters();
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
				_editorActions = new Dictionary();
				_editorActions[Character.INITIAL_STATE] = new CharacterState(
					"Welcome to DC, kid. My name is Dingus MacElroy, and I'm going to show you the ropes",
					'Go on'
				);
				_editorActions[Character.GO_TO_SOURCE] = new CharacterState(
					"I need you to uncover something about something!",
					"Chase down a source"
				);
				_editorActions[Character.MISSION_FAIL] = new CharacterState(
					"You failed to dig up what we needed for the story!",
					"Go home and rest up."
				);
				_editorActions[Character.MISSION_SUCCESS] = new CharacterState(
					"Good work, kid. You could make a career of it yet! Let's grab a sarsaparilla and I'll tell you about the dark underbelly of D.C.",
					"Have a sarsaparilla with the boss."
				);
				var editor:Character = new Character(
					'Editor in Chief',
					'assets/images/jjj.jpg',
					_editorActions
				);
				_editor = editor;
			}

			return _editor;
		}
		
		private function generateSourceCharacters():Vector.<Character>
		{
			var chars:Vector.<Character> = new Vector.<Character>();
			
			var actions:Dictionary = new Dictionary();
			actions[Character.ASK_QUESTION] = new CharacterState(
				"I ain't got time for your bullshit! Do you even know anything about how Washington works?",
				'Answer My Question'
			);
			actions[Character.MISSION_FAIL] = new CharacterState(
				"Go back to Kansas, hayseed!",
				'Return to your boss'
			);
			actions[Character.MISSION_SUCCESS] = new CharacterState(
				"You know your stuff, perhaps.",
				"Return to Editor"
			);
			chars.push(new Character("Sally Source", "img/fakeImg.png", actions));
			
			return chars;
		}
	}
}