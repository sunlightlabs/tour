package com.sunlightfoundation.decipherdc.model
{
	import com.sunlightfoundation.decipherdc.model.vo.Location;
	
	import org.robotlegs.mvcs.Actor;
	
	public class GameStateModel extends Actor implements IGameStateModel
	{
		protected var _taskSequence:Vector.<Location>;
		
		public function GameStateModel()
		{
			super();
		}
		
		// Needs work
		public function get currentTaskId():int
		{
			return 0;
		}
		
		public function set currentTaskId(value:int):void
		{
		}
		
		public function get taskSequence():Vector.<Location>
		{
			// Should handler for generating new task sequence go here?
			return _taskSequence;
		}
		
		public function set taskSequence(value:Vector.<Location>):void
		{
			_taskSequence = value;
		}
	}
}