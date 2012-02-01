package com.sunlightfoundation.decipherdc.view
{
	import com.sunlightfoundation.decipherdc.events.GameEvent;
	import com.sunlightfoundation.decipherdc.view.effects.QuickFade;
	import com.sunlightfoundation.decipherdc.view.events.ViewEvent;
	
	import org.robotlegs.mvcs.Mediator;
	
	public class SourcePickerViewMediator extends Mediator
	{
		[Inject]
		public var sourcePickerView:SourcePickerView;
		
		override public function onRegister():void
		{
			eventMap.mapListener(sourcePickerView, ViewEvent.TARGET_CLICK, onButtonClick);
			
			var fadeOut:QuickFade = new QuickFade();
			fadeOut.alphaFrom = sourcePickerView.alpha;
			fadeOut.alphaTo = 0.0;

			sourcePickerView.setStyle("removedEffect", fadeOut);
		}
		
		private function onButtonClick(event:ViewEvent):void
		{
			trace("SourcePickerViewMediator button click: '" + sourcePickerView.selected + "'");
			
			dispatch(new GameEvent(GameEvent.SOURCE_SELECTED, {'sourceName': sourcePickerView.selected}));
		}
	}
}