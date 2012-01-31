package com.sunlightfoundation.decipherdc.controller.bootstrap
{
	import com.sunlightfoundation.decipherdc.controller.*;
	import com.sunlightfoundation.decipherdc.controller.bootstrap.*;
	import com.sunlightfoundation.decipherdc.controller.events.*;
	import com.sunlightfoundation.decipherdc.model.events.ModelEvent;
	import com.sunlightfoundation.decipherdc.service.events.DatabaseEvent;
	
	import org.robotlegs.mvcs.Command;
	
	public class BootstrapAppStartup extends Command
	{
		override public function execute():void
		{
			trace("BootstrapAppStartup run");
			commandMap.mapEvent(DatabaseEvent.READY, BootstrapModels, DatabaseEvent, true); // means non-db models are waiting for db to be ready...
			commandMap.mapEvent(DatabaseEvent.READY, ConfigureModelsCommand, DatabaseEvent, true);
			commandMap.mapEvent(AppEvent.READY, GenerateTaskSequence, AppEvent, true);
			commandMap.mapEvent(AppEvent.READY, BootstrapGameplayCommand, AppEvent, true);
			commandMap.mapEvent(AppEvent.READY, StartGameCommand, AppEvent, true);
			commandMap.mapEvent(AppEvent.INITIALIZE, BootstrapDatabaseCommand, AppEvent, true);
			commandMap.mapEvent(AppEvent.INITIALIZE, BootstrapViewMediators, AppEvent, true);
			commandMap.mapEvent(ModelEvent.DATA_LOADED, CheckGameplayReadyCommand, ModelEvent, true);
		}
	}
}