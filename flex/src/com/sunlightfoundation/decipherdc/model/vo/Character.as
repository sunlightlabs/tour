package com.sunlightfoundation.decipherdc.model.vo
{
	import flash.utils.Dictionary;

	public class Character
	{
		private var _name:String;
		private var _image:String;
		private var _actions:Dictionary;
		private var _dialogue:String;
		private var _actionText:String;
		
		public static const INITIAL_STATE:String = 'Character.initialState';
		public static const GO_TO_SOURCE:String = 'Character.gotoSource';
		public static const MISSION_FAIL:String = 'Character.missionFail';
		public static const MISSION_SUCCESS:String = 'Character.missionSuccess';
		
		public function Character(name:String, image:String, actionsDict:Dictionary)
		{
			this._name = name;
			this._image = image;
			_actions = actionsDict;
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
		
		public function set state(state_name:String):void
		{
			trace("settings state to: " + state_name);
			if (_actions.propertyIsEnumerable(state_name))
			{
				trace("                      _actions has: " + state_name);
				trace("_actions[state_name]['dialogue']  : " + _actions[state_name]['dialogue']);
				trace("_actions[state_name]['actionText']: " + _actions[state_name]['actionText']);
				_dialogue = _actions[state_name]['dialogue'];
				_actionText = _actions[state_name]['actionText'];
			}
		}
	}
}