package marioslots.controller.commands.SwitchGameStateCommands
{
	import marioslots.controller.signals.SwitchGameStateSignals.GameTrackEndSignal;
	import marioslots.controller.signals.SwitchGameStateSignals.GetSpinSignal;
	import marioslots.model.LevelDataModel;
	import marioslots.model.MainModel;
	
	import org.robotlegs.mvcs.StarlingSignalCommand;

	public class AnimationDoneCommand extends StarlingSignalCommand
	{
		[Inject]
		public var _data:MainModel;
		
		[Inject]
		public var _levels:LevelDataModel;			

		[Inject]
		public var _gameWinSignal:GameTrackEndSignal;
		
		[Inject]
		public var _getSpinSignal:GetSpinSignal;		
		
		override public function execute():void
		{
			if ( (_data.levelProgres + 1) <= _levels._maxSteps)
			{
				_data.levelProgres++;
				_getSpinSignal.dispatch();	
			}
			else
			{
				_gameWinSignal.dispatch();		
			}
		}
	}
}