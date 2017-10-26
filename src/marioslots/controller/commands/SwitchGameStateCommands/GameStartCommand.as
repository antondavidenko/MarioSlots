package marioslots.controller.commands.SwitchGameStateCommands
{
	import marioslots.controller.signals.SwitchGameStateSignals.GetSpinSignal;
	import marioslots.model.LevelDataModel;
	import marioslots.model.MainModel;
	import marioslots.services.SpinService;
	
	import org.robotlegs.mvcs.StarlingSignalCommand;

	public class GameStartCommand extends StarlingSignalCommand
	{
		[Inject]
		public var _getSpinSignal:GetSpinSignal;
		
		[Inject]
		public var _data:MainModel;		
				
		override public function execute():void
		{
			_data.levelProgres = 0;
			_data.coinsAtLevel = 0;
			_getSpinSignal.dispatch();				
		}
	}
}