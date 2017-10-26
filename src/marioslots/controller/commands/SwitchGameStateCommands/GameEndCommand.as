package marioslots.controller.commands.SwitchGameStateCommands
{
	import marioslots.controller.signals.SwitchScreenStateSignal;
	import marioslots.model.MainModel;
	import marioslots.model.VO.ScreenStateClassVO;
	import marioslots.view.screenstates.lobby.LobbyView;
	
	import org.robotlegs.mvcs.StarlingSignalCommand;

	public class GameEndCommand extends StarlingSignalCommand
	{
		[Inject]
		public var _data:MainModel;	

		[Inject]
		public var _switchStateSignal:SwitchScreenStateSignal;		
		
		override public function execute():void
		{
			_data.coinsGlobal += _data.coinsAtLevel;
			_switchStateSignal.dispatch(new ScreenStateClassVO(LobbyView));	
		}
	}
}