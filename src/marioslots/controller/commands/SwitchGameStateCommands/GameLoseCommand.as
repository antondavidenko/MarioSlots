package marioslots.controller.commands.SwitchGameStateCommands
{
	import marioslots.controller.signals.ShowWindowSignal;
	import marioslots.model.MainModel;
	import marioslots.view.ui.GameLoseWindowView;
	
	import org.robotlegs.mvcs.StarlingSignalCommand;
	
	public class GameLoseCommand extends StarlingSignalCommand
	{
		[Inject]
		public var _data:MainModel;	
		
		[Inject]
		public var _showWindowSignal:ShowWindowSignal;
		
		override public function execute():void
		{
			_showWindowSignal.dispatch( GameLoseWindowView );
		}
	}
}