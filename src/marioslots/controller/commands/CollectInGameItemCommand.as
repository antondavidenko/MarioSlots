package marioslots.controller.commands
{
	import marioslots.model.MainModel;
	
	import org.robotlegs.mvcs.StarlingSignalCommand;

	public class CollectInGameItemCommand extends StarlingSignalCommand
	{
		[Inject]
		public var _data:MainModel;	
		
		override public function execute():void
		{
			_data.coinsAtLevel++;
		}
	}
}