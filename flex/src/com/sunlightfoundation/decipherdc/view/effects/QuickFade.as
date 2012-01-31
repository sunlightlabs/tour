package com.sunlightfoundation.decipherdc.view.effects
{
	import spark.effects.Fade;
	
	public class QuickFade extends Fade
	{
		public function QuickFade(target:Object=null)
		{
			this.duration = 250;
			super(target);
		}
			
	}
}