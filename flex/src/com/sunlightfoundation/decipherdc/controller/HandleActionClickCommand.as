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
			trace("HandleActionClickCommand: " + gameState.currentCharacter.state);
			switch(gameState.currentCharacter.state)
			{
				case Character.GO_TO_SOURCE:
				{
					dispatch(new GameEvent(GameEvent.GO_TO_SOURCE));
					break;
				}
					
				case Character.ASK_QUESTION:
				{
					dispatch(new QuizEvent(QuizEvent.ASK_QUESTION));
					break;
				}
					
				case Character.MISSION_SUCCESS:
				{
					dispatch(new GameEvent(GameEvent.MISSION_SUCCESS));
					break;
				}
					
				default:
				{
					break;
				}
			}
		}
	}
}