package com.sunlightfoundation.decipherdc.controller
{
	import com.sunlightfoundation.decipherdc.model.events.CharacterEvent;
	import com.sunlightfoundation.decipherdc.view.CharacterView;
	
	import org.robotlegs.mvcs.Command;
	
	public class ShowCharacterViewCommand extends Command
	{
		[Inject]
		public var characterViewEvent:CharacterEvent;
		
		[Inject]
		public var view:CharacterView;
		
		override public function execute():void
		{
//			ViewNavigatorApplication(contextView).addElement(view);
		}
	}
}