package com.sunlightfoundation.decipherdc.view.components
{
	
	import com.sunlightfoundation.decipherdc.view.skins.LightBoxSkin;
	
	import mx.core.IDataRenderer;
	import mx.events.FlexEvent;
	
	import spark.components.Group;
	import spark.components.SkinnableContainer;
	import spark.effects.Fade;
	
	
	/**
	 *  Dispatched when the <code>data</code> property changes.
	 *  
	 *  @langversion 3.0
	 *  @playerversion AIR 2.5
	 *  @productversion Flex 4.5
	 * 
	 *  @eventType mx.events.FlexEvent.DATA_CHANGE
	 * 
	 */
	[Event(name="dataChange", type="mx.events.FlexEvent")]
	
	
	public class LightBox extends SkinnableContainer implements IDataRenderer
	{
		private var _data:Object;
		private var fadeIn:Fade;
		
		public function LightBox()
		{
			super();
			setStyle("skinClass", LightBoxSkin);

			visible = false;
			fadeIn = new Fade();
			fadeIn.alphaFrom = 0.0;
			fadeIn.alphaTo = 1.0;
			fadeIn.duration = 1000;
			fadeIn.target = this;
			setStyle("creationCompleteEffect", fadeIn);
		}
		
		[Bindable("dataChange")]
		public function get data():Object
		{
			return null;
		}
		
		public function set data(value:Object):void
		{
			_data = value;
			
			if (hasEventListener(FlexEvent.DATA_CHANGE))
				dispatchEvent(new FlexEvent(FlexEvent.DATA_CHANGE));
		}
		
		override protected function getCurrentSkinState():String
		{
			return super.getCurrentSkinState();
		} 
		
		override protected function partAdded(partName:String, instance:Object) : void
		{
			super.partAdded(partName, instance);
		}
		
		override protected function partRemoved(partName:String, instance:Object) : void
		{
			super.partRemoved(partName, instance);
		}
		

		override protected function updateDisplayList(unscaledWidth:Number, unscaledHeight:Number):void
		{
			contentGroup.x = 10;
			contentGroup.y = 10;
			contentGroup.width = this.width - 20;
			contentGroup.height = this.height - 20;
			super.updateDisplayList(unscaledWidth, unscaledHeight);
			
			
		}
		
	}
}