package com.sunlightfoundation.decipherdc.controller
{
	import com.sunlightfoundation.decipherdc.events.GameEvent;
	import com.sunlightfoundation.decipherdc.model.IGameConfig;
	import com.sunlightfoundation.decipherdc.model.IGameState;
	import com.sunlightfoundation.decipherdc.model.vo.Character;
	
	import org.robotlegs.mvcs.Command;
	
	public class IntroGameCommand extends Command
	{

		[Inject]
		public var gameConfig:IGameConfig;
		
		[Inject]
		public var gameState:IGameState;

		override public function execute():void
		{
			trace("IntroGameCommand run");
//			var editor:Character = gameConfig.editorCharacter;
//			gameState.nextPhase = new GameEvent(GameEvent.GO_TO_SOURCE);
//			editor.setState( gameConfig.editorCharacterState(GameEvent.NEW_MISSION) );
//			gameState.currentCharacter = editor;
//			
//			dispatch(new GameEvent(GameEvent.SHOW_CHARACTER, { 'refresh': false }));
			dispatch(new GameEvent(GameEvent.NEW_MISSION, { 'new': true }));
		}
	}
}