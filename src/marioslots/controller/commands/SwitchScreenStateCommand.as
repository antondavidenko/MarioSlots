package marioslots.controller.commands
{
	import flash.utils.getDefinitionByName;
	
	import marioslots.model.LevelDataModel;
	import marioslots.model.MainModel;
	import marioslots.model.VO.ScreenStateClassVO;
	import marioslots.services.SpinService;
	import marioslots.view.screenstates.game.GameView;
	
	import org.robotlegs.mvcs.StarlingSignalCommand;
	
	import starling.display.DisplayObject;
	import starling.display.Sprite;
	
	public class SwitchScreenStateCommand extends StarlingSignalCommand
	{
		[Inject]
		public var _screenID:ScreenStateClassVO;
		
		[Inject]
		public var _data:MainModel;		
		
		[Inject]
		public var _levelsData:LevelDataModel;
		
		[Inject]
		public var _spinService:SpinService;			
		
		override public function execute():void
		{
trace(" !!! SCREEN CLASS !!! " + _screenID.data + " !!! PARAMS !!! " + _screenID.params);
			if (_screenID.data == GameView)
			{
				_data.currentLevel = Number(_screenID.params);
				
				_levelsData.setupLevel(_data.currentLevel);
				_spinService.values = _levelsData.levelValuesById(_data._currentLevel);
				_spinService.addToField = _levelsData.levelAddItemsById(_data._currentLevel);				
			}

			var currentScreen:DisplayObject = contextView.getChildAt(0);
			contextView.removeChild(currentScreen);
			currentScreen = null;
			
			var screenClass:Class = _screenID.data;
			var nextView:Sprite = new screenClass();
			contextView.addChild(nextView);
		}
	}
}

