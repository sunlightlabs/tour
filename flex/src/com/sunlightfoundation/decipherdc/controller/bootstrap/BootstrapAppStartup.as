package com.sunlightfoundation.decipherdc.controller.bootstrap
{
	import com.sunlightfoundation.decipherdc.controller.*;
	import com.sunlightfoundation.decipherdc.controller.bootstrap.*;
	import com.sunlightfoundation.decipherdc.controller.events.*;
	import com.sunlightfoundation.decipherdc.events.*;
	import com.sunlightfoundation.decipherdc.service.events.DatabaseEvent;
	
	import org.robotlegs.mvcs.Command;
	
	public class BootstrapAppStartup extends Command
	{
		override public function execute():void
		{
			trace("BootstrapAppStartup run");
			commandMap.mapEvent(DatabaseEvent.READY, BootstrapModels, DatabaseEvent, true);
			commandMap.mapEvent(DatabaseEvent.READY, ConfigureModelsCommand, DatabaseEvent, true);
			commandMap.mapEvent(DatabaseEvent.DATA_LOADED, StartGameCommand, DatabaseEvent, true);
			commandMap.mapEvent(AppEvent.INITIALIZE, BootstrapDatabaseCommand, AppEvent, true);
		}
	}
}