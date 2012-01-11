package com.sunlightfoundation.decipherdc.model.vo
{
	import com.sunlightfoundation.utils.ArrayUtils;
	
	import mx.collections.ArrayCollection;
	
	[Bindable]
	public class QuizItem
	{
		public var question:String;
		public var answer:String;
		public var distractors:Array;
		private var _answers:Array;
		private var _selected:String;
		
		public function QuizItem(question:String="", answer:String="", distractors:Array=null)
		{
			this.question = question;
			this.answer = answer;
			this.distractors = distractors;
			this._selected = null;
			var combinedArr:Array = distractors.concat(answer);
			_answers = ArrayUtils.shuffle(combinedArr);
		}
		
		public function get answers():ArrayCollection
		{
			return new ArrayCollection(_answers);
		}
		
		public function set selected(value:String):void
		{
			if(this._selected === null)
			{
				this._selected = value;
			}
		}
		
		public function get selected():String
		{
			return this._selected;
		}
	}
}