package com.sunlightfoundation.decipherdc.model
{
	import com.sunlightfoundation.decipherdc.model.vo.Location;

	public interface IGameStateModel
	{
		function get currentTaskId():int;
		
		function set currentTaskId(value:int):void;
		
		function get taskSequence():Vector.<Location>;
		
		function set taskSequence(value:Vector.<Location>):void;
	}
}