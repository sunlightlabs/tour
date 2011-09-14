package com.sunlightfoundation.decipherdc.model
{
	import com.sunlightfoundation.decipherdc.model.vo.Location;
	
	import mx.collections.ArrayCollection;
	
	import org.robotlegs.mvcs.Actor;
	
	public class LocationListModel extends Actor
	{
		private var _locations:ArrayCollection;
		private var _selected:Location;
		
		public function getLocationById(id:int):Location
		{
			for each(var location:Location in locations)
			{
				trace("Looking at location.id="+location.id);
				if(location.id == id) return location;
			}
			return null;
		}
		
		public function get locations():ArrayCollection
		{
			return _locations ||= new ArrayCollection();
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
				locations.addItem(location);
			}
		}
	}
}