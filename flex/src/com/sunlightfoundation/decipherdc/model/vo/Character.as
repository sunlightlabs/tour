package com.sunlightfoundation.decipherdc.model.vo
{
	[Bindable]
	public class Character
	{
		public var name:String;
		public var image:String;
		public var dialogue:String;
		public var actionText:String;
		
		public function Character(name:String="")
		{
			this.name = name;
		}
	}
}