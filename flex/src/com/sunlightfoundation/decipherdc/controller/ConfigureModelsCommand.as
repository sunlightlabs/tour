package com.sunlightfoundation.decipherdc.controller
{
	import com.sunlightfoundation.decipherdc.model.IGameConfig;
	import com.sunlightfoundation.decipherdc.model.IGameState;
	import com.sunlightfoundation.decipherdc.model.LocationListModel;
	import com.sunlightfoundation.decipherdc.model.vo.Character;
	import com.sunlightfoundation.decipherdc.model.vo.Location;
	import com.sunlightfoundation.decipherdc.model.vo.QuizItem;
	import com.sunlightfoundation.decipherdc.service.ILocationService;
	import com.sunlightfoundation.decipherdc.view.CharacterView;
	
	import org.robotlegs.mvcs.Command;
	
	public class ConfigureModelsCommand extends Command
	{
		[Inject]
		public var locationService:ILocationService;
		
		[Inject]
		public var gameState:IGameState;
		
		[Inject]
		public var gameConfig:IGameConfig;
		
		override public function execute():void
		{
			trace("ConfigureModelsCommand run");
			locationService.loadAllLocations();
			// load characters
			// load dialogue
			// load config
		}
		
	}
}