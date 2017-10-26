package marioslots.controller.commands
{
	import org.robotlegs.mvcs.StarlingSignalCommand;
	
	import starling.display.Sprite;
	
	public class CloseWindowCommand extends StarlingSignalCommand
	{
		[Inject]
		public var _window:Sprite;
		
		override public function execute():void
		{
			contextView.removeChild(_window);			
		}
	}
}