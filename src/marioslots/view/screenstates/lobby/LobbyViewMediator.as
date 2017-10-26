package marioslots.view.screenstates.lobby
{
	import marioslots.controller.signals.SwitchScreenStateSignal;
	import marioslots.model.VO.ScreenStateClassVO;
	import marioslots.view.AbstractViewMediator;
	import marioslots.view.screenstates.game.GameView;
	
	public class LobbyViewMediator extends AbstractViewMediator
	{
		[Inject]
		public var _view:LobbyView;
		
		[Inject]
		public var _switchStateSignal:SwitchScreenStateSignal;
	
		override public function onRegister():void
		{
trace("================== LOBBY REGISTER");				
			super.onRegister();
			_view.clickSignal.add(gameButtonCallback);
			_mainModel.addGlobalCoinBinding(_view, "updateBalanceView");
		}
		
		override public function preRemove():void
		{
			_view.clickSignal.remove(gameButtonCallback);
trace("================== LOBBY REMOVED");			
			_view.removeListeners();
			_mainModel.removeGlobalCoinBinding(_view, "updateBalanceView");
			
			_view.dispose();
		}
		
		private function gameButtonCallback($id:String):void
		{
			_switchStateSignal.dispatch(new ScreenStateClassVO(GameView, $id));
		}
	}
}