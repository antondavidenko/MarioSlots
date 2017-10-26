package marioslots.view.ui
{
	import marioslots.view.AbstractView;
	
	import org.osflash.signals.Signal;
	
	import starling.display.Button;
	import starling.display.MovieClip;
	import starling.text.TextField;

	public class AbstractWindowView extends AbstractView
	{
		public var _clickSignal:Signal = new Signal();
		protected var _dialogWindow:MovieClip;
		protected var _dialogText:TextField;
		protected var _okButton:Button;		
		
		public function AbstractWindowView()
		{
		}
	}
}