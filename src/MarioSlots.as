package  {
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	
	import marioslots.MarioSlotsContext;
	
	import starling.core.Starling;
	
	[SWF(frameRate = "60", width = "960", height = "640")]
	public class MarioSlots extends Sprite 
	{
		protected var _context:MarioSlotsContext;
		protected var _starling:Starling;
		
		public function MarioSlots() 
		{ 
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		protected function onAddedToStage(event:Event):void
		{
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
			
			_starling = new Starling(StarlingGame, stage);
			_starling.start();
		}		
	}
}