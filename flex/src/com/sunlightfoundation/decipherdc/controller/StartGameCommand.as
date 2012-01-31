package com.sunlightfoundation.decipherdc.controller
{
	
	import com.sunlightfoundation.decipherdc.events.GameEvent;
	import com.sunlightfoundation.decipherdc.model.IGameConfig;
	import com.sunlightfoundation.decipherdc.model.IGameState;
	import com.sunlightfoundation.decipherdc.model.vo.Character;
	
	import org.robotlegs.mvcs.Command;
		
	public class StartGameCommand extends Command
	{
		[Inject]
		public var gameConfig:IGameConfig;
		
		[Inject]
		public var gameState:IGameState;

		override public function execute():void
		{
			trace("StartGameCommand run");
			// If we have a don't have a non-zero mission sequence, create a new one
			// Are we in the middle of a mission or are we starting a new mission?
			if(true)
			{
				var editor:Character = gameConfig.editorCharacter;
				gameState.nextPhase = new GameEvent(GameEvent.INTRO_GAME);
				editor.state = gameConfig.editorCharacterState(GameEvent.INTRO_GAME);
				gameState.currentCharacter = editor;
				
				dispatch(new GameEvent(GameEvent.SHOW_CHARACTER, { 'new': true }));
			}
		}
	}
}