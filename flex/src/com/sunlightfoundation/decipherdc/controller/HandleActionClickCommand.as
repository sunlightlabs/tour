package com.sunlightfoundation.decipherdc.controller
{
	import com.sunlightfoundation.decipherdc.events.GameEvent;
	import com.sunlightfoundation.decipherdc.events.QuizEvent;
	import com.sunlightfoundation.decipherdc.model.IGameState;
	import com.sunlightfoundation.decipherdc.model.vo.Character;
	
	import org.robotlegs.mvcs.Command;
	
	public class HandleActionClickCommand extends Command
	{
		
		[Inject]
		public var gameState:IGameState;
		
		override public function execute():void
		{
			trace("HandleActionClickCommand: " + gameState.nextPhase.type);
			dispatch(gameState.nextPhase);
		}
	}
}