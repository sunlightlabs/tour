package com.sunlightfoundation.decipherdc.controller
{
	import com.sunlightfoundation.decipherdc.events.GameEvent;
	import com.sunlightfoundation.decipherdc.model.GameState;
	import com.sunlightfoundation.decipherdc.model.IGameConfig;
	import com.sunlightfoundation.decipherdc.model.IGameState;
	import com.sunlightfoundation.decipherdc.model.LocationListModel;
	import com.sunlightfoundation.decipherdc.model.vo.Character;
	import com.sunlightfoundation.decipherdc.model.vo.Location;
	
	import org.robotlegs.mvcs.Command;
	
	import spark.components.Application;
	
	public class StartMissionCommand extends Command
	{
		[Inject]
		public var locationListModel:LocationListModel;
		
		[Inject]
		public var gameConfig:IGameConfig;

		[Inject]
		public var gameState:IGameState;

		override public function execute():void
		{
			// Generate mission based on randomized list of locations
			trace("StartMissionCommand run");
						
			var location:Location = gameState.taskSequence[0];
			
			trace(location.name);
			locationListModel.selected = location;
						
			var editor:Character = gameConfig.editorCharacter;
			editor.state = Character.GO_TO_SOURCE;
			gameState.currentCharacter = editor;
			
			dispatch(new GameEvent(GameEvent.SHOW_CHARACTER));
		}
	}
}