package com.sunlightfoundation.decipherdc.model.vo
{
	import mx.collections.ArrayCollection;
	
	[Bindable]
	public class QuizItem
	{
		public var question:String;
		public var answers:ArrayCollection;
		
		public function QuizItem()
		{
		}
	}
}