package com.sunlightfoundation.decipherdc.view.skins
{
	import flash.text.TextFieldAutoSize;
	
	import spark.skins.mobile.ButtonSkin;
	
	public class MultilineButtonSkin extends ButtonSkin
	{
		import flashx.textLayout.formats.LineBreak;
		import spark.components.supportClasses.StyleableTextField;
		import mx.events.FlexEvent;
		
		public function MultilineButtonSkin()
		{
			super();
		}
		
		override protected function createChildren():void
		{
			labelDisplay = StyleableTextField(createInFontContext(StyleableTextField));
			labelDisplay.styleName = this;
			labelDisplay.multiline = true;
			labelDisplay.wordWrap = true;
			labelDisplay.autoSize = TextFieldAutoSize.LEFT;
			labelDisplay.lineBreak = LineBreak.TO_FIT;
			

			// update shadow when labelDisplay changes
//			labelDisplay.addEventListener(FlexEvent.VALUE_COMMIT, labelDisplay_valueCommitHandler);
			
			addChild(labelDisplay);
			
			if (!labelDisplayShadow && labelDisplay)
			{
				labelDisplayShadow = StyleableTextField(createInFontContext(StyleableTextField));
				labelDisplayShadow.styleName = this;
//				labelDisplayShadow.colorName = "textShadowColor";
//				labelDisplayShadow.useTightTextBounds = false;
				
				// add shadow before display
//				addChildAt(labelDisplayShadow, getChildIndex(labelDisplay));
			}
			
			setStyle("textAlign", "left");
		}
		
		override protected function measure():void{
			labelDisplay.commitStyles();
			super.measure();

		}
		
		override protected function updateDisplayList(unscaledWidth:Number, unscaledHeight:Number):void
		{
//			trace("updateDisplayList unscaledHeight: " + unscaledHeight);
			trace("updateDisplayList this.height: " + this.height);
			trace("updateDisplayList this.labelDisplay.height: " + this.labelDisplay.height);
			
//			The labelDisplay (StyleableTextField) sometimes takes a while to finish sizing when there is multiline text, 
//			so we need to invalidateSize() if the labelDisplay (plus padding) doesn't fit in the button.
			if (this.height <= StyleableTextField(labelDisplay).height + layoutPaddingTop + layoutPaddingBottom)
				invalidateSize();
			
			labelDisplay.commitStyles();
			super.updateDisplayList(unscaledWidth, unscaledHeight);
		}
		
		override protected function labelDisplay_valueCommitHandler(event:FlexEvent):void
		{
			super.labelDisplay_valueCommitHandler(event);
		}
		
		override protected function drawBackground(unscaledWidth:Number, unscaledHeight:Number):void
		{
			super.drawBackground(unscaledWidth, unscaledHeight);
//			var chromeColor:uint = getStyle("chromeColor");
//			graphics.beginFill(chromeColor);
//			graphics.drawRoundRect(layoutBorderSize, layoutBorderSize, unscaledWidth - (layoutBorderSize * 2), 
//				unscaledHeight - (layoutBorderSize * 2),
//				layoutCornerEllipseSize, layoutCornerEllipseSize);
//			graphics.endFill();
		}

	}
}