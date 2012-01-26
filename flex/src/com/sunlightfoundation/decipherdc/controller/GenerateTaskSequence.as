package com.sunlightfoundation.decipherdc.controller
{
	import com.sunlightfoundation.decipherdc.model.IGameState;
	import com.sunlightfoundation.decipherdc.model.LocationListModel;
	import com.sunlightfoundation.decipherdc.model.vo.Location;
	import com.sunlightfoundation.utils.ArrayUtils;
	
	import org.robotlegs.mvcs.Command;
	
	public class GenerateTaskSequence extends Command
	{
		[Inject]
		public var locationListModel:LocationListModel;
		
		[Inject]
		public var gameStateModel:IGameState;

		override public function execute():void
		{
			var unshuffled_tasks:Array = locationListModel.getLocationsByType('task').toArray();
			var task_sequence:Vector.<Location> = Vector.<Location>(ArrayUtils.shuffle(unshuffled_tasks));
			gameStateModel.taskSequence = task_sequence;
		}
	}
}