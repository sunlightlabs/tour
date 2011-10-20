package com.sunlightfoundation.decipherdc.model
{
	import collections.ArrayList;
	import collections.ArraySet;
	
	import com.sunlightfoundation.decipherdc.model.events.ModelEvent;
	import com.sunlightfoundation.decipherdc.model.vo.Location;
	
	import org.robotlegs.mvcs.Actor;
	
	public class LocationListModel extends Actor
	{
		private var _locations:ArraySet;
		private var _selected:Location;
		private var _loaded:Boolean;
		
		public function getLocationById(id:int):Location
		{
			for each(var location:Location in locations)
			{
				if(location.id == id) return location;
			}
			return null;
		}
		
		public function get loaded():Boolean
		{
			return _loaded || false;
		}
		
		public function set loaded(value:Boolean):void
		{
			if (value) _loaded = value;
			dispatch(new ModelEvent(ModelEvent.DATA_LOADED, this));
		}
		
		public function getLocationsByType(type:String):ArrayList
		{
			var _typeLocations:ArrayList = new ArrayList();
			for each(var location:Location in locations)
			{
				if(location.type == type) _typeLocations.add(location);
			}
			return _typeLocations;
		}
		
		public function get locations():ArraySet
		{
			return _locations ||= new ArraySet();
		}
		
		public function get selected():Location 
		{
			if (!_selected) return null;
			return _selected;
		}
		
		public function set selected(value:Location):void 
		{
			_selected = value;
//			set event for location selected?
		}
		
		public function addLocation(location:Location):void
		{
			if(!locations.contains(location)) {
				locations.add(location);
			}
		}
	}
}