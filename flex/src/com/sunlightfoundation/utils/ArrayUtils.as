package com.sunlightfoundation.utils
{
	public class ArrayUtils
	{
		public static function shuffle(inputArray:Array):Array
		{
			var shuffledArray:Array = new Array;
			
			for(var n:int=inputArray.length-1; n >= 0; n--)
			{
				var r:int = Math.random()* inputArray.length;
				shuffledArray.push(inputArray[r]);
				inputArray.splice(r,1);
			}
			return shuffledArray;
		}
	}
}