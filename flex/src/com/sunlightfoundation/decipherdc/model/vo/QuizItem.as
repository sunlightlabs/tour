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
		
		public function QuizItem(question:String="", answer:String="", distractors:Array=null)
		{
			this.question = question;
			this.answer = answer;
			this.distractors = distractors;
			var combinedArr:Array = distractors.concat(answer);
			_answers = ArrayUtils.shuffle(combinedArr);
		}
		
		public function get answers():ArrayCollection
		{
			return new ArrayCollection(_answers);
		}
	}
}