package com.sunlightfoundation.decipherdc.service
{
	import com.probertson.data.SQLRunner;
	import com.sunlightfoundation.decipherdc.model.LocationListModel;
	import com.sunlightfoundation.decipherdc.model.vo.Location;
	import com.sunlightfoundation.decipherdc.controller.events.LocationsLoadedEvent;
	
	import flash.data.SQLResult;
	import flash.errors.SQLError;
	
	import org.robotlegs.mvcs.Actor;
	
	public class SQLLocationService extends Actor implements ILocationService
	{
		[Inject]
		public var sqlRunner:SQLRunner;
		
		[Inject]
		public var locationListModel:LocationListModel;
		
		public function loadAllLocations():void
		{

			sqlRunner.execute(LOAD_ALL_LOCATIONS, {}, loadAllLocationsResultHandler, Location);
		}
		
		public function loadLocationById(id:int):void
		{
		}
		
		private function loadAllLocationsResultHandler(result:SQLResult):void
		{
			trace("loadAllLocationsResultHandler: " + result.data.length);

            for each(var location:Location in result.data)
            {
                locationListModel.addLocation(location);
            }
			dispatch(new LocationsLoadedEvent());

		}
		
		[Embed(source="data/sql/LoadAllLocations.sql", mimeType="application/octet-stream")]
		private static const LoadAllLocations:Class;
		public static const LOAD_ALL_LOCATIONS:String = new LoadAllLocations();
	}
}