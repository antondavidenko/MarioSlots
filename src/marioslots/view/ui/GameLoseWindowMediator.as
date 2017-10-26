package marioslots.view.ui
{
	import marioslots.controller.signals.CloseWindowSignal;
	import marioslots.controller.signals.SwitchGameStateSignals.GameEndSignal;
	import marioslots.model.LevelDataModel;
	import marioslots.model.MainModel;
	import marioslots.view.AbstractViewMediator;
	
	public class GameLoseWindowMediator extends AbstractViewMediator 
	{
		[Inject]
		public var _view:GameLoseWindowView;		
		
		[Inject]
		public var _gameEndSignal:GameEndSignal;	
		
		[Inject]
		public var _closeWindowSignal:CloseWindowSignal;
		
		[Inject]
		public var _data:MainModel;			
		
		[Inject]
		public var _levels:LevelDataModel;	
		
		override public function onRegister():void
		{
			super.onRegister();
			_view._clickSignal.add(gameButtonCallback);
			_view.setBonusInfo( _data.coinsAtLevel );			
		}
		
		override public function preRemove():void
		{
			_view._clickSignal.remove(gameButtonCallback);	
			_view.dispose();
		}
		
		private function gameButtonCallback():void
		{
			_gameEndSignal.dispatch();
			_closeWindowSignal.dispatch(_view);
		}
	}
}


