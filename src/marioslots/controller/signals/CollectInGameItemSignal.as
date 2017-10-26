package marioslots.controller.signals
{
	import marioslots.model.VO.GameItemVO;
	
	import org.osflash.signals.Signal;

	public class CollectInGameItemSignal extends Signal
	{
		public function CollectInGameItemSignal()
		{
			super(GameItemVO);
		}
	}
}