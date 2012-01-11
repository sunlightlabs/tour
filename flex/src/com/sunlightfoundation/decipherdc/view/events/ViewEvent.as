package com.sunlightfoundation.decipherdc.view.events
{
	import flash.events.Event;
	
	import mx.core.UIComponent;
	
	import spark.components.View;
	
	public class ViewEvent extends Event
	{
		public static const REMOVE:String = "ViewEvent.remove";
		public static const SHOW:String = "ViewEvent.show";
		
		private var _view:UIComponent;
		private var _transition:Boolean;
		
		public function ViewEvent(type:String, view:UIComponent, transition:Boolean=false, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			_view = view;
			_transition = transition;
			super(type, bubbles, cancelable);
		}
		
		public function get view():UIComponent
		{
			return _view;
		}
		
		public function get transition():Boolean
		{
			return _transition;
		}
		
		override public function clone():Event
		{
			return new ViewEvent(type, view, bubbles, cancelable);
		}

	}
}