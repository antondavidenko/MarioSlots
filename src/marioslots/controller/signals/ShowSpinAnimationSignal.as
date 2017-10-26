package marioslots.controller.signals
{
	import marioslots.model.VO.SpinDataVO;
	
	import org.osflash.signals.Signal;

	public class ShowSpinAnimationSignal extends Signal
	{
		public function ShowSpinAnimationSignal()
		{
			super(SpinDataVO);
		}
	}
}