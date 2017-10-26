package marioslots.controller.signals
{
	import starling.display.Sprite;
	
	import org.osflash.signals.Signal;
	
	public class CloseWindowSignal extends Signal
	{
		public function CloseWindowSignal()
		{
			super(Sprite);			
		}
	}
}