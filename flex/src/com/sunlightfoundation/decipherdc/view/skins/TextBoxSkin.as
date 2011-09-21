package com.sunlightfoundation.decipherdc.view.skins
{
	
	import mx.core.mx_internal;
	
	import spark.core.SpriteVisualElement;
	import spark.skins.mobile.TextAreaSkin;
	
	use namespace mx_internal;
	
	public class TextBoxSkin extends TextAreaSkin
	{
		mx_internal static const DEFAULT_RIGHT_MARGIN:int = 5;
		mx_internal static const DEFAULT_LEFT_MARGIN:int  = 5;
				
		public function TextBoxSkin()
		{
			super();
			borderClass = SpriteVisualElement;
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
			textDisplay.left = textDisplay.left ? textDisplay.left : TextBoxSkin.DEFAULT_LEFT_MARGIN;
			textDisplay.right = textDisplay.right ? textDisplay.right : TextBoxSkin.DEFAULT_RIGHT_MARGIN;
		}
		
//		override protected 

	}
}