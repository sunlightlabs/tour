package com.sunlightfoundation.decipherdc.model.vo
{
	import flash.utils.Dictionary;
	
	import mx.utils.StringUtil;

	[Bindable]
	public class Character
	{
		private var _name:String;
		private var _image:String;
		private var _actions:Dictionary;
		private var _dialogue:String;
		private var _actionText:String;
		
		public function Character(name:String, image:String)
		{
			this._name = name;
			this._image = image;
		}
		
		public function set name(input:String):void { };
		public function get name():String
		{
			return _name;
		}

		public function set image(input:String):void { };
		public function get image():String
		{
			return _image;
		}
		
		public function set dialogue(input:String):void { };
		public function get dialogue():String
		{
			return _dialogue;
		}
		
		public function set actionText(input:String):void { };
		public function get actionText():String
		{
			return _actionText;
		}
		
		public function set state(characterState:CharacterState):void
		{
			_dialogue = characterState.dialogue;
			_actionText = characterState.actionText;
			
		}
		
		public function updateDialogue(... rest):void
		{
			_dialogue = StringUtil.substitute(_dialogue, rest);
		}
				
	}
}