package com.sunlightfoundation.decipherdc.model.vo
{
	public class CharacterState extends Object
	{
		private var _dialogue:String;
		private var _actionText:String;
		
		public function CharacterState(dialogue:String, actionText:String)
		{
			super();
			_dialogue = dialogue;
			_actionText = actionText;
		}
		
		public function get dialogue():String
		{
			return _dialogue;
		}
		
		public function get actionText():String
		{
			return _actionText;
		}
	}
}