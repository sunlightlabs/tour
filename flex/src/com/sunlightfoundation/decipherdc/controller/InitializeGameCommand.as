package com.sunlightfoundation.decipherdc.controller
{
	import com.sunlightfoundation.decipherdc.controller.events.AppEvent;

	import org.robotlegs.mvcs.Command;
	
	public class InitializeGameCommand extends Command
	{
		
		override public function execute():void
		{
			trace("InitializeGameCommand run");
			var evt:AppEvent = new AppEvent(AppEvent.INITIALIZE);
			dispatch(evt);
		}
		
	}
}