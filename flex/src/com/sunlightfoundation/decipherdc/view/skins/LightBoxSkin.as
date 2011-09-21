package com.sunlightfoundation.decipherdc.view.skins
{
	import com.sunlightfoundation.decipherdc.view.components.LightBox;
	
	import spark.components.Group;
	import spark.skins.mobile.supportClasses.MobileSkin;
	
	public class LightBoxSkin extends MobileSkin
	{
		public var hostComponent:LightBox;
		
		public var contentGroup:Group;
		
		public function LightBoxSkin()
		{
			super();
		}
		
		override protected function drawBackground(unscaledWidth:Number, unscaledHeight:Number):void
		{
			super.drawBackground(unscaledWidth, unscaledHeight);
			graphics.beginFill(0x000000, 0.5);
			graphics.drawRect(0,0,unscaledWidth, unscaledHeight);
			var chromeColor:uint = getStyle("chromeColor");
			graphics.beginFill(chromeColor,1);
			graphics.drawRect(10,10,unscaledWidth-20, unscaledHeight-20);
			
		}
		
		override protected function createChildren():void
		{
			contentGroup = new Group();
			addChild(contentGroup);
			super.createChildren();
		}

	}
}