package marioslots.controller.commands.SwitchGameStateCommands
{
	import marioslots.controller.signals.ShowWindowSignal;
	import marioslots.model.LevelDataModel;
	import marioslots.model.MainModel;
	import marioslots.view.ui.GameWinWindowView;
	
	import org.robotlegs.mvcs.StarlingSignalCommand;

	public class GameWinCommand extends StarlingSignalCommand
	{
		[Inject]
		public var _data:MainModel;	
		
		[Inject]
		public var _levelsData:LevelDataModel;
		
		[Inject]
		public var _showWindowSignal:ShowWindowSignal;
		
		override public function execute():void
		{
			var lvlBonus:int = _levelsData.levelBountyById(_data._currentLevel);
			_showWindowSignal.dispatch( GameWinWindowView );
		}
	}
}