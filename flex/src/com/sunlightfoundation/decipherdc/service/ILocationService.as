package com.sunlightfoundation.decipherdc.service
{
	import com.sunlightfoundation.decipherdc.model.vo.Location;
	
	public interface ILocationService
	{
		function loadAllLocations():void;
		
		function loadLocationById(id:int):void;
		
//		function loadLocationsByType(type:String):void;
	}
}