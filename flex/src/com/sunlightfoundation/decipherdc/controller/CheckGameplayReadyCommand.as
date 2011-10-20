package com.sunlightfoundation.decipherdc.controller
{
	import com.sunlightfoundation.decipherdc.controller.events.AppEvent;
	import com.sunlightfoundation.decipherdc.model.IGameConfig;
	import com.sunlightfoundation.decipherdc.model.LocationListModel;
	import com.sunlightfoundation.decipherdc.model.events.ModelEvent;
	
	import org.robotlegs.mvcs.Command;
	
	public class CheckGameplayReadyCommand extends Command
	{
		[Inject]
		public var event:ModelEvent;
				
		[Inject]
		public var gameConfig:IGameConfig;
		
		[Inject]
		public var locationListModel:LocationListModel;
		
		
		override public function execute():void
		{
			/*
				Locations must be loaded from DB into LocationListModel
				GameConfig must be loaded...
				Characters and Dialogue must be loaded from GameConfig
				GameStateModel must be loaded...
				Task sequence must be retrieved from GameStateModel or intialized from LocationListModel
			*/
			trace("CheckGameplayReadyCommand running... ");
			trace("		event.type = " + event.type);
			trace("		gameConfig.loaded = " + gameConfig.loaded);
			trace("		locationListModel.loaded = " + locationListModel.loaded);
			
			if (gameConfig.loaded && locationListModel.loaded) dispatch(new AppEvent(AppEvent.READY));
		}
	}
}