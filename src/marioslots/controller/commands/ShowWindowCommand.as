package marioslots.controller.commands
{
	import org.robotlegs.mvcs.StarlingSignalCommand;
	
	import starling.display.Sprite;

	public class ShowWindowCommand extends StarlingSignalCommand
	{
		[Inject]
		public var _windowClass:Class;		
		
		override public function execute():void
		{
			var window:Sprite = new _windowClass();
			contextView.addChild(window);			
		}
	}
}