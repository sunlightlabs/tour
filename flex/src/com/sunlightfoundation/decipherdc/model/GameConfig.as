package com.sunlightfoundation.decipherdc.model
{
	import com.sunlightfoundation.decipherdc.model.events.ModelEvent;
	import com.sunlightfoundation.decipherdc.model.vo.Character;
	
	public class GameConfig extends Object implements IGameConfig
	{	
		protected var _sourceCharacters:Vector.<Character>;
		protected var _loaded:Boolean;
		
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
			var editor:Character = new Character(
				'Editor in Chief',
				'assets/images/jjj.jpg',
				'Welcome to DC, kid',
				'Go on'
			);
			return editor;
		}
		
		private function generateSourceCharacters():Vector.<Character>
		{
			var chars:Vector.<Character> = new Vector.<Character>();
			
			chars.push(new Character("Sally Source", "img/fakeImg.png", "default dialogue?", "Let me ask you somethin'"));
			
			return chars;
		}
	}
}