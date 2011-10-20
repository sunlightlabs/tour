package com.sunlightfoundation.decipherdc.model.events
{
	import flash.events.Event;
	
	public class ModelEvent extends Event
	{
		public static const DATA_LOADED:String = "ModelEvent.dataLoaded";
		
		protected var _model:*;

		public function get model():*
		{
			return _model;
		}
			
		public function ModelEvent(type:String, model:*, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			_model = model;
		}
		
		override public function clone():Event
		{
			return new ModelEvent(type, model, bubbles, cancelable);
		}
	}
}