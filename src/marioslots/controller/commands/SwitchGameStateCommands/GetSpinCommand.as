package marioslots.controller.commands.SwitchGameStateCommands
{
	import marioslots.controller.signals.ShowSpinAnimationSignal;
	import marioslots.model.MainModel;
	import marioslots.services.SpinService;
	
	import org.robotlegs.mvcs.StarlingSignalCommand;

	public class GetSpinCommand extends StarlingSignalCommand
	{
		[Inject]
		public var _spinService:SpinService;
		
		[Inject]
		public var _showSpinAnimationSignal:ShowSpinAnimationSignal;		
		
		[Inject]
		public var _data:MainModel;			
		
		override public function execute():void
		{
			_spinService.getSpin();
			_showSpinAnimationSignal.dispatch(_data._spinData);			
		}
	}
}