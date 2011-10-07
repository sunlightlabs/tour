package com.sunlightfoundation.decipherdc.view.components
{
	
	import com.sunlightfoundation.decipherdc.view.skins.MultilineButtonSkin;
	
	import flash.text.TextLineMetrics;
	
	import spark.components.Button;
	import spark.components.supportClasses.StyleableTextField;
	
	
	public class MultilineButton extends Button
	{
		
		public function MultilineButton()
		{
			super();
			setStyle("skinClass", MultilineButtonSkin);
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
		
	}
}