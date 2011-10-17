package com.sunlightfoundation.decipherdc.controller
{
	import com.sunlightfoundation.decipherdc.model.LocationListModel;
	import com.sunlightfoundation.decipherdc.model.vo.Character;
	import com.sunlightfoundation.decipherdc.model.vo.Location;
	import com.sunlightfoundation.decipherdc.view.CharacterView;
	
	import mx.utils.StringUtil;
	
	import org.robotlegs.mvcs.Command;
	
	public class StartGameCommand extends Command
	{
		[Inject]
		public var locationListModel:LocationListModel;

		override public function execute():void
		{
			trace("StartGameCommand run");
			var view:* = generateSampleView();

		}
		
		private function generateSampleView():*
		{
			var randInt:int = Math.floor(Math.random()*locationListModel.locations.length)+1;
			trace("get location["+randInt+"]");
			var location:Location = locationListModel.getLocationById(randInt);
			trace(location.name);
			locationListModel.selected = location;
			var tempData:Character = new Character();
			
			tempData.image = 'assets/images/jjj.jpg';
			tempData.name = 'Editor in Chief';
			tempData.dialogue = StringUtil.substitute("We are investigating {0}. I think {1} may be spending gobs of money, but I need you to find out! Here's my list of sources. Go pump them for information! Tattooed 8-bit ethical locavore raw denim. Gluten-free +1 food truck, sustainable helvetica gentrify wayfarers skateboard PBR ethical. Letterpress thundercats raw denim, terry richardson artisan twee sustainable homo banh mi master cleanse vice viral keytar keffiyeh. Tattooed raw denim lo-fi sustainable, vegan cosby sweater lomo wes anderson yr banh mi wayfarers 8-bit bicycle rights farm-to-table. Cred raw denim stumptown trust fund you probably haven't heard of them, Austin yr 8-bit scenester fanny pack letterpress keytar butcher mixtape dreamcatcher. Skateboard portland homo biodiesel ethical. Single-origin coffee echo park williamsburg organic, fap banh mi mcsweeney's.", location.category, location.name);
			tempData.actionText = "Go to a Source";
			var view:CharacterView = new CharacterView();
			
			view.data = tempData;
			//			view.image.source = tempData.image;
			//			view.dialogue.text = tempData.dialogue;
			
			//			var quizView:QuizView = new QuizView();
			//			
			//			var quizItem:QuizItem = new QuizItem();
			//			quizItem.question = "Who was the first president of the United States?";
			//			quizItem.answers = new ArrayCollection([
			//				'Tina Fey',
			//				'George Washington',
			//				'John Q Public is a name I made up and I want to see how the button expands and how the vertical layout adjusts to longer text.',
			//				'Steve McQueen'
			//			]);
			//			quizView.data = quizItem;
			//			quizView.width = contextView.stage.width;
			
			trace("contextView.stage.width: "+contextView.stage.width);
			trace("contextView.stage.height: "+contextView.stage.height);
			
			//			quizView.open(ViewNavigatorApplication(contextView).navigator);
			
			
			//			var feedBackView:FeedbackView = new FeedbackView();
			//			ViewNavigatorApplication(contextView).navigator.pushView(FeedbackView);
			//			ViewNavigatorApplication(contextView).navigator.addElement(feedBackView);
			
			
			//			ViewNavigatorApplication(contextView).navigator.addElement(quizView);
			
			return view;
		}

	}
}