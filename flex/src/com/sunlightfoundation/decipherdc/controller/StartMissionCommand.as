package com.sunlightfoundation.decipherdc.controller
{
	import com.sunlightfoundation.decipherdc.model.IGameConfig;
	import com.sunlightfoundation.decipherdc.model.IGameStateModel;
	import com.sunlightfoundation.decipherdc.model.LocationListModel;
	import com.sunlightfoundation.decipherdc.model.events.CharacterEvent;
	import com.sunlightfoundation.decipherdc.model.vo.Character;
	import com.sunlightfoundation.decipherdc.model.vo.Location;
	
	import mx.utils.StringUtil;
	
	import org.robotlegs.mvcs.Command;
	
	import spark.components.Application;
	
	public class StartMissionCommand extends Command
	{
		[Inject]
		public var locationListModel:LocationListModel;
		
		[Inject]
		public var gameConfig:IGameConfig;

		[Inject]
		public var gameStateModel:IGameStateModel;

		override public function execute():void
		{
			// Generate mission based on randomized list of locations
			trace("StartMissionCommand run");
						
			trace("gameStateModel.taskSequence.length: " + gameStateModel.taskSequence.length);
			
			var location:Location = gameStateModel.taskSequence[0];
			
			trace(location.name);
			locationListModel.selected = location;
			
			var character:Character = gameConfig.editorCharacter;
			character.dialogue = StringUtil.substitute("We are investigating {0}. I think {1} may be spending gobs of money, but I need you to find out! Here's my list of sources. Go pump them for information! Tattooed 8-bit ethical locavore raw denim. Gluten-free +1 food truck, sustainable helvetica gentrify wayfarers skateboard PBR ethical. Letterpress thundercats raw denim, terry richardson artisan twee sustainable homo banh mi master cleanse vice viral keytar keffiyeh. Tattooed raw denim lo-fi sustainable, vegan cosby sweater lomo wes anderson yr banh mi wayfarers 8-bit bicycle rights farm-to-table. Cred raw denim stumptown trust fund you probably haven't heard of them, Austin yr 8-bit scenester fanny pack letterpress keytar butcher mixtape dreamcatcher. Skateboard portland homo biodiesel ethical. Single-origin coffee echo park williamsburg organic, fap banh mi mcsweeney's.", location.category, location.name);
			character.actionText = "Go to a Source";

			dispatch(new CharacterEvent(CharacterEvent.SHOW, character));
		}
	}
}