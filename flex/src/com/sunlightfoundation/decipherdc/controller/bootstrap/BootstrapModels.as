package com.sunlightfoundation.decipherdc.controller.bootstrap
{
	import com.sunlightfoundation.decipherdc.model.GameConfig;
	import com.sunlightfoundation.decipherdc.model.GameState;
	import com.sunlightfoundation.decipherdc.model.IGameConfig;
	import com.sunlightfoundation.decipherdc.model.IGameState;
	import com.sunlightfoundation.decipherdc.model.LocationListModel;
	import com.sunlightfoundation.decipherdc.service.ILocationService;
	import com.sunlightfoundation.decipherdc.service.SQLLocationService;
	import com.sunlightfoundation.decipherdc.service.events.DatabaseEvent;
	
	import org.robotlegs.mvcs.Command;
	
	public class BootstrapModels extends Command
	{

		override public function execute():void
		{
			trace("BootstrapModels run");
			injector.mapSingletonOf(ILocationService, SQLLocationService);
			injector.mapSingleton(LocationListModel);
			// game state singleton that loads/saves/contains app state?
			injector.mapSingletonOf(IGameState, GameState);
			injector.mapSingletonOf(IGameConfig, GameConfig);
			
		}
		

	}
}