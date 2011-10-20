package com.sunlightfoundation.decipherdc.model.vo
{
	[Bindable]
	public class Character
	{
		public var name:String;
		public var image:String;
		public var dialogue:String;
		public var actionText:String;
		
		public function Character(name:String="", image:String="", dialogue:String="", actionText:String="")
		{
			this.name = name;
			this.image = image;
			this.dialogue = dialogue;
			this.actionText = actionText;
		}
	}
}