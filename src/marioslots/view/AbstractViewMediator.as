package marioslots.view
{
	import marioslots.model.MainModel;
	
	import org.robotlegs.mvcs.StarlingMediator;

	public class AbstractViewMediator extends StarlingMediator
	{
		[Inject] 
		public var _mainModel:MainModel;			
		
		public function AbstractViewMediator()
		{
		}
		
		override public function onRegister():void
		{
			(this.viewComponent as AbstractView).assets = _mainModel._assets;
		}
	}
}