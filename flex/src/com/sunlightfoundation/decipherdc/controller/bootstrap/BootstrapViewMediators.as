package com.sunlightfoundation.decipherdc.controller.bootstrap
{
	import com.sunlightfoundation.decipherdc.view.*;
	
	import org.robotlegs.mvcs.Command;
	
	public class BootstrapViewMediators extends Command
	{
		override public function execute():void
		{
			mediatorMap.mapView(CharacterView, CharacterViewMediator);
			mediatorMap.mapView(QuizView, QuizViewMediator);
			mediatorMap.mapView(SourcePickerView, SourcePickerViewMediator);
		}
	}
}