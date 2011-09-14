package com.sunlightfoundation.decipherdc.model.vo
{
	[Bindable]
	public class Location
	{
		public var id:int;
		public var name:String;
		public var description:String;
		public var address:String;
		public var link:String;
		public var latitude:Number;
		public var longitude:Number;
		public var type:String;
		public var category:String;
		public var has_visited:Boolean;
		
		public function Location(name:String= "")
		{
			this.name = name;
		}
	}
}