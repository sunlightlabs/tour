package com.sunlightfoundation.decipherdc.controller.bootstrap
{
	import com.sunlightfoundation.decipherdc.events.CharacterViewEvent;
	import com.sunlightfoundation.decipherdc.model.LocationListModel;
	import com.sunlightfoundation.decipherdc.service.ILocationService;
	import com.sunlightfoundation.decipherdc.model.vo.Character;
	import com.sunlightfoundation.decipherdc.model.vo.Location;
	import com.sunlightfoundation.decipherdc.model.vo.QuizItem;
	
	
	import com.sunlightfoundation.decipherdc.view.CharacterView;

	
	import org.robotlegs.mvcs.Command;

	import mx.collections.ArrayCollection;
	import mx.utils.StringUtil;
	
	public class ConfigureModelsCommand extends Command
	{
		[Inject]
		public var locationService:ILocationService;
		
		
		override public function execute():void
		{
			trace("ConfigureModelsCommand run");
			locationService.loadAllLocations();

			
		}
		
	}
}