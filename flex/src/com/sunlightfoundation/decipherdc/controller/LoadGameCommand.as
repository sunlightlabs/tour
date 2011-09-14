package com.sunlightfoundation.decipherdc.controller
{
	import com.sunlightfoundation.decipherdc.service.ILocationService;
	
	import org.robotlegs.mvcs.Command;
	
	public class LoadGameCommand extends Command
	{
		[Inject]
		public var locationService:ILocationService;
		
		override public function execute():void {
			locationService.loadAllLocations();
		}
	}
}