package com.sunlightfoundation.decipherdc.controller
{
	import com.sunlightfoundation.decipherdc.events.GameEvent;
	import com.sunlightfoundation.decipherdc.model.IGameConfig;
	import com.sunlightfoundation.decipherdc.model.IGameState;
	import com.sunlightfoundation.decipherdc.model.vo.Character;
	
	import org.robotlegs.mvcs.Command;
	
	public class ShowFailureCommand extends Command
	{
		[Inject]
		public var gameConfig:IGameConfig;
		
		[Inject]
		public var gameState:IGameState;

		override public function execute():void
		{
			var editor:Character = gameConfig.editorCharacter;
			gameState.nextPhase = new GameEvent(GameEvent.MISSION_FAILED);
			editor.state = gameConfig.editorCharacterState(GameEvent.MISSION_FAILED);
			gameState.currentCharacter = editor;
			
			dispatch(new GameEvent(GameEvent.SHOW_CHARACTER));
		}
	}
}