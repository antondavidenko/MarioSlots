package marioslots.view
{
	import marioslots.controller.signals.CollectInGameItemSignal;
	import marioslots.controller.signals.ShowSpinAnimationSignal;
	import marioslots.controller.signals.SwitchGameStateSignals.AnimationDoneSignal;
	import marioslots.controller.signals.SwitchGameStateSignals.GameLoseSignal;
	import marioslots.controller.signals.SwitchGameStateSignals.GameStartSignal;
	import marioslots.controller.signals.SwitchGameStateSignals.GameTrackEndSignal;
	import marioslots.controller.signals.SwitchGameStateSignals.GameWinSignal;
	import marioslots.model.LevelDataModel;
	import marioslots.model.VO.GameItemVO;
	import marioslots.model.VO.SpinDataVO;
	import marioslots.view.screenstates.game.GameView;
	
	public class GameViewMediator extends AbstractViewMediator
	{
		[Inject]
		public var _view:GameView;
		
		[Inject]
		public var _levels:LevelDataModel;			
		
		[Inject]
		public var _showSpinAnimationSignal:ShowSpinAnimationSignal;
		
		[Inject]
		public var _animationDoneSignal:AnimationDoneSignal;		
		
		[Inject]
		public var _gameLoseSignal:GameLoseSignal;
		
		[Inject]
		public var _gameTrackEndSignal:GameTrackEndSignal;		

		[Inject]
		public var _gameWinSignal:GameWinSignal;			
		
		[Inject]
		public var _gameStartSignal:GameStartSignal;			
		
		[Inject]
		public var _collectInGameItemSignal:CollectInGameItemSignal;	
		
		private var _currentSpinData:SpinDataVO;	
		
		private var _coinCounter:Number = 0;
		private var _progressCounter:Number = 0;		

		public function get progressCounter():Number
		{
			return _progressCounter;
		}
		
		public function set progressCounter($value:Number):void
		{
			_progressCounter = $value;
			_view.setupProgres( _progressCounter );
		}		
		
		public function get coinCounter():Number
		{
			return _coinCounter;
		}
		
		public function set coinCounter($value:Number):void
		{
			_coinCounter = $value;
			_view.setupCoinsTextField(_coinCounter);
		}
		
		override public function onRegister():void
		{
			_view._levelLen = _levels._maxSteps+1;
			super.onRegister();
			
			_showSpinAnimationSignal.add(doSpinAnimation);
			_gameTrackEndSignal.add(onGameTrackEnd);
			
			_mainModel.addAtLevelCoinBinding(this, "coinCounter");
			_mainModel.addProgressBinding(this, "progressCounter");
			
			_view._slot._spinIsEndSignal.add(onSpinAnimationIsEnd);
			_view._platformer._holdIsEndSignal.add(onHoldIsEnd);
			_view._platformer._collisionDetection._coinCollisionSignal.add(onCoinCollected);
			_view._platformer._collisionDetection._enemyLoseCollisionSignal.add(onEnemyLoseCollision);
			_view._platformer._collisionDetection._enemyWinCollisionSignal.add(onEnemyWinCollision);
			_view._platformer.dieAnimationEndSignal.add(onDieAnimationEnd);
			_view._platformer._winAnimationIsEndSignal.add(onWinAnimationEnd);
			
			_gameStartSignal.dispatch();
		}
		
		override public function preRemove():void
		{
			_showSpinAnimationSignal.remove(doSpinAnimation);
			_gameTrackEndSignal.remove(onGameTrackEnd);			
			
			_mainModel.removeAtLevelCoinBinding(this, "coinCounter");
			_mainModel.removeProgressBinding(this, "progressCounter");

			_view._slot._spinIsEndSignal.remove(onSpinAnimationIsEnd);
			_view._platformer._holdIsEndSignal.remove(onHoldIsEnd);
			_view._platformer._collisionDetection._coinCollisionSignal.remove(onCoinCollected);
			_view._platformer._collisionDetection._enemyLoseCollisionSignal.remove(onEnemyLoseCollision);
			_view._platformer._collisionDetection._enemyWinCollisionSignal.remove(onEnemyWinCollision);
			_view._platformer.dieAnimationEndSignal.remove(onDieAnimationEnd);			
			
			_view.removeListeners();
			_view.dispose();
		}
	
		private function doSpinAnimation($spinData:SpinDataVO):void
		{
			_currentSpinData = $spinData;
			_view._slot.doSpinAnimation(_currentSpinData);
		}
		
		private function onSpinAnimationIsEnd():void
		{
			_view._platformer.addToFieldBySpin(_currentSpinData);
		}	
		
		private function onHoldIsEnd():void
		{
			_animationDoneSignal.dispatch();
		}	
		
		private function onCoinCollected($id:int):void
		{
			_collectInGameItemSignal.dispatch(new GameItemVO(GameItemVO.COIN));
			_view._platformer.removeCoinByID($id);
		}

		private function onEnemyLoseCollision($id:int):void
		{
			_collectInGameItemSignal.dispatch(new GameItemVO(GameItemVO.COIN));
			_view._platformer.removeEnemyByID($id);
		}	
		
		private function onEnemyWinCollision($id:int):void
		{
			_view._platformer.heroDoDie();
			_view.setPause(true);
		}	
		
		private function onDieAnimationEnd():void
		{
			_gameLoseSignal.dispatch();
		}
		
		private function onGameTrackEnd():void
		{
			_view._platformer.onWin();
		}		
		
		private function onWinAnimationEnd():void
		{
			_gameWinSignal.dispatch();
		}
	}
}