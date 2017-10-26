package marioslots.view.screenstates.game.platformer
{
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import marioslots.model.VO.SpinDataVO;
	import marioslots.view.CollisionDetection;
	import marioslots.view.screenstates.game.platformer.levelObjects.CoinsObjects;
	import marioslots.view.screenstates.game.platformer.levelObjects.EnemyObjects;
	
	import org.osflash.signals.Signal;
	
	import starling.animation.Transitions;
	import starling.animation.Tween;
	import starling.core.Starling;
	import starling.utils.AssetManager;

	public class PlatformerView extends TrackView
	{
		private var _currentSpinData:SpinDataVO;

		private const HOLD_TIMER:int = 3000;		
		private var _holdTimer:Timer;
		public var _holdIsEndSignal:Signal = new Signal();
		public var _onWinSignal:Signal = new Signal();
		public var _winAnimationIsEndSignal:Signal = new Signal();
		
		private const WIN_TIMER:int = 6000;		
		private var _winTimer:Timer;
		
		private var _enemyObjects:EnemyObjects; 
		private var _coinsObjects:CoinsObjects;
		private var _hero:HeroView = new HeroView();
		
		public var _collisionDetection:CollisionDetection = new CollisionDetection();
		
		private var _isGameRun:Boolean = true;
		
		private var _assets:AssetManager;
		
		public function PlatformerView()
		{
		}
		
		override public function drawScreen($assets:AssetManager):void
		{
			super.drawScreen($assets);
			
			_assets = $assets;
		
			_enemyObjects = new EnemyObjects();
			this.addChild(_enemyObjects);
			
			_coinsObjects = new CoinsObjects();
			this.addChild(_coinsObjects);
			
			_hero.drawScreen($assets);
			addChild(_hero);			
		}		
		
		public function addToFieldBySpin($spinData:SpinDataVO):void
		{
			_currentSpinData = $spinData;
			var i:int;
			for (i=0; i<_currentSpinData._addToField.length; i++)
			{
				if (_currentSpinData._addToField[i])
				{
					addElementByPlaceAndID(i,_currentSpinData._addToField[i])					
				}
			}
			
			_holdTimer = new Timer(HOLD_TIMER);				
			_holdTimer.addEventListener(TimerEvent.TIMER, endHold);
			_holdTimer.start();			
		}
		
		public function onWin():void
		{
			super.addCastle();
			_winTimer = new Timer(WIN_TIMER);				
			_winTimer.addEventListener(TimerEvent.TIMER, endWinTimer);
			_winTimer.start();			
		}		
		
		private function addElementByPlaceAndID($positionID:int, $id:int):void
		{
			if ($id == 2)
			{
				//_enemyObjects.addObject(_enemyTexture, $positionID);
				_enemyObjects.addEnemy(_assets, $positionID);
			}
			else if ($id == 0)
			{
				//_coinsObjects.addObject(_coinTexture, $positionID);
				_coinsObjects.addCoin(_assets, $positionID);
			}
		}
		
		override public function update(isRun:Boolean = true):void
		{
			super.update(_isGameRun);
			
			if (_isGameRun)
			{
				_coinsObjects.update();
				_enemyObjects.update();
				
				_collisionDetection.detectCoinColission(_hero.getHeroBounds(), _coinsObjects.getBoundsList());
				_collisionDetection.detectEnemyColission(_hero.getHeroBounds(), _enemyObjects.getBoundsList(), _hero.inAir);
			}
		}
		
		public function endHold(event:TimerEvent):void 
		{
			_holdTimer.removeEventListener(TimerEvent.TIMER, endHold);
			_holdIsEndSignal.dispatch();			
		}
		
		public function endWinTimer(event:TimerEvent):void 
		{
			_hero.doWin();
			_isGameRun = false;
			_onWinSignal.dispatch();
			
			var tween:Tween = new Tween(flag, 2, Transitions.EASE_IN);
			tween.moveTo(flag.x, flag.y - 187);
			tween.onComplete = function():void {
				_winAnimationIsEndSignal.dispatch();
			};
			Starling.juggler.add(tween);	
			
			_winTimer.removeEventListener(TimerEvent.TIMER, endWinTimer);
			_winTimer.reset();
			_winTimer = null;	
		}
		
		public function removeListeners():void
		{
			if (_holdTimer)
			{
				_holdTimer.removeEventListener(TimerEvent.TIMER, endHold);
				_holdTimer.reset();
				_holdTimer = null;
			}
			
			if (_winTimer)
			{
				_winTimer.removeEventListener(TimerEvent.TIMER, endWinTimer);
				_winTimer.reset();
				_winTimer = null;
			}
			
			_hero.removeListeners();
		}
		
		public function removeEnemyByID(id:int):void
		{
			_enemyObjects.removeItemByID(id);
		}	
		
		public function removeCoinByID(id:int):void
		{
			_coinsObjects.removeItemByID(id);
		}
		
		public function heroDoJump():void
		{
			_hero.doJump();
		}
		
		public function heroDoDie():void
		{
			_hero.doDie();
		}	
		
		public function get dieAnimationEndSignal():Signal
		{
			return _hero._dieAnimationEndSignal;
		}
	}
}