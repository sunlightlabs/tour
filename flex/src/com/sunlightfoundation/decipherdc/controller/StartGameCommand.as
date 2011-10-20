package com.sunlightfoundation.decipherdc.controller
{
	
	import com.sunlightfoundation.decipherdc.controller.events.AppEvent;
	
	import org.robotlegs.mvcs.Command;
		
	public class StartGameCommand extends Command
	{

		override public function execute():void
		{
			trace("StartGameCommand run");
			// If we have a don't have a non-zero mission sequence, create a new one
			// Are we in the middle of a mission or are we starting a new mission?
			if(true)
			{
				dispatch(new AppEvent(AppEvent.NEW_MISSION));
			}
		}
	}
}