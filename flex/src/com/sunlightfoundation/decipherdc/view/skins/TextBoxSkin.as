package com.sunlightfoundation.decipherdc.view.skins
{
	import spark.skins.mobile.TextAreaSkin;
	
	public class TextBoxSkin extends TextAreaSkin
	{
		public function TextBoxSkin()
		{
			super();
		}
		
		override protected function drawBackground(unscaledWidth:Number, unscaledHeight:Number):void
		{
			//			super.drawBackground(unscaledWidth, unscaledHeight);
			
			var borderSize:uint = (border) ? layoutBorderSize : 0;
			var borderWidth:uint = borderSize * 2;
			
			// Draw the contentBackgroundColor
			graphics.beginFill(getStyle("contentBackgroundColor"), getStyle("contentBackgroundAlpha"));
			graphics.drawRect(borderSize, borderSize, unscaledWidth - borderWidth, unscaledHeight - borderWidth);
			graphics.endFill();
		}
		
		override protected function createChildren():void
		{
			super.createChildren();
			textDisplay.editable = false;
			textDisplay.selectable = false;
		}

	}
}