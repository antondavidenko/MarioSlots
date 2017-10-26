package marioslots.controller.signals
{
	import marioslots.model.VO.ScreenStateClassVO;
	
	import org.osflash.signals.Signal;
	
	public class SwitchScreenStateSignal extends Signal
	{
		public function SwitchScreenStateSignal()
		{
			super(ScreenStateClassVO);
		}
	}
}