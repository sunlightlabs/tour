package com.sunlightfoundation.decipherdc.controller
{
	import com.sunlightfoundation.decipherdc.controller.events.AppEvent;
	import com.sunlightfoundation.decipherdc.model.events.CharacterEvent;
	import com.sunlightfoundation.decipherdc.model.LocationListModel;
	import com.sunlightfoundation.decipherdc.model.vo.Character;
	import com.sunlightfoundation.decipherdc.model.vo.Location;
	import com.sunlightfoundation.decipherdc.model.vo.QuizItem;
	import com.sunlightfoundation.decipherdc.view.*;
	import com.sunlightfoundation.decipherdc.view.CharacterView;
	import com.sunlightfoundation.decipherdc.view.QuizView;
	
	import mx.collections.ArrayCollection;
	import mx.utils.StringUtil;
	
	import org.robotlegs.mvcs.Command;
	
	public class InitializeGameCommand extends Command
	{
		
		override public function execute():void
		{
			trace("InitializeGameCommand run");
			var evt:AppEvent = new AppEvent(AppEvent.INITIALIZE);
			dispatch(evt);
		}
		
	}
}