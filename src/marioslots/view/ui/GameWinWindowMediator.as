package marioslots.view.ui
{
	import marioslots.controller.signals.CloseWindowSignal;
	import marioslots.controller.signals.SwitchGameStateSignals.GameEndSignal;
	import marioslots.model.LevelDataModel;
	import marioslots.model.MainModel;
	import marioslots.view.AbstractViewMediator;

	public class GameWinWindowMediator extends AbstractViewMediator 
	{
		[Inject]
		public var _view:GameWinWindowView;		
		
		[Inject]
		public var _gameEndSignal:GameEndSignal;	
		
		[Inject]
		public var _closeWindowSignal:CloseWindowSignal;
		
		[Inject]
		public var _data:MainModel;			

		[Inject]
		public var _levels:LevelDataModel;	
		
		private var _lvlBonus:int;
		
		public function set lvlBonus($value:Number):void
		{
			_lvlBonus = $value;
			_view.setBonusInfo(_lvlBonus, _data.coinsAtLevel);
			_data.coinsAtLevel += _lvlBonus;
		}
		
		override public function onRegister():void
		{
			super.onRegister();
			_view._clickSignal.add(gameButtonCallback);	
			_levels.addBonusBinding(this, "lvlBonus");			
		}
		
		override public function preRemove():void
		{
			_levels.removeBonusBinding(this, "lvlBonus");
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