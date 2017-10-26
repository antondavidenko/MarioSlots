package marioslots.view.screenstates.game.slot
{
	import flash.events.TimerEvent;
	import flash.geom.Rectangle;
	import flash.utils.Timer;
	
	import marioslots.model.VO.SpinDataVO;
	import marioslots.view.ViewUtils;
	
	import org.osflash.signals.Signal;
	
	import starling.animation.Transitions;
	import starling.animation.Tween;
	import starling.core.Starling;
	import starling.display.MovieClip;
	import starling.display.Sprite;
	import starling.textures.Texture;
	import starling.utils.AssetManager;

	public class SlotView extends Sprite
	{
		public var _symbolCoin:Texture;		
		public var _symbolCheast:Texture;
		public var _symbolEnemy:Texture;
		public var _symbolGround:Texture;
		
		private var _slot1:MovieClip;
		private var _slot2:MovieClip;
		private var _slot3:MovieClip;	
		
		private var _currentSpinData:SpinDataVO;
		private var _spinTimer:Timer;
		public var _spinIsEndSignal:Signal = new Signal();		
		
		private const SPIN_TIMER:int = 500;
		private const SPIN_SPEED:Number = 0.1;

		private var _isPaused:Boolean = false;
		
		public function setPause($setPause:Boolean):void
		{
			_isPaused = $setPause;
		}		
		
		public function SlotView()
		{
			this.clipRect = new Rectangle(506, 413, 440, 135);
			
			//var quad:Quad = new Quad(440, 135, Color.rgb(0,255,0) );
			//quad.x = 506;
			//quad.y = 413;
			//addChild(quad);			
		}
		
		public function drawScreen($assets:AssetManager):void
		{
			_symbolCheast = $assets.getTexture("cheast0000");
			_symbolCoin = $assets.getTexture("coin10000");
			_symbolEnemy = $assets.getTexture("enemy1_walk10000");
			_symbolGround = $assets.getTexture("ground0000");
			
			_slot1 = ViewUtils.dropMovieClip(new <Texture>[_symbolCoin, _symbolCheast, _symbolEnemy, _symbolGround], 525, 430, this);
			_slot1.scaleX = _slot1.scaleY = 2;
			
			_slot2 = ViewUtils.dropMovieClip(new <Texture>[_symbolCoin, _symbolCheast, _symbolEnemy, _symbolGround], 675, 430, this);
			_slot2.scaleX = _slot2.scaleY = 2;
			
			_slot3 = ViewUtils.dropMovieClip(new <Texture>[_symbolCoin, _symbolCheast, _symbolEnemy, _symbolGround], 825, 430, this);
			_slot3.scaleX = _slot3.scaleY = 2;
			
			setupSlotsValue([0,0,0]);
		}
		
		public function setupSlotsValue($values:Array):void
		{
			_slot1.currentFrame = $values[0];
			_slot1.pause();
			
			_slot2.currentFrame = $values[1];
			_slot2.pause();
			
			_slot3.currentFrame = $values[2];
			_slot3.pause();
		}
		
		public function doSpinAnimation($spinData:SpinDataVO):void
		{
			_currentSpinData = $spinData;
			spinAnimation(_slot1, 0);		
			spinAnimation(_slot2, 1);		
			spinAnimation(_slot3, 2);
			
			_spinTimer = new Timer(SPIN_TIMER);				
			_spinTimer.addEventListener(TimerEvent.TIMER, endSpin);
			_spinTimer.start();
		}
		
		public function endSpin(event:TimerEvent):void 
		{
			_spinTimer.removeEventListener(TimerEvent.TIMER, endSpin);
			setupSlotsValue(_currentSpinData._values);
			if (!_isPaused)
			{			
				_spinIsEndSignal.dispatch();
			}
		}
		
		private function spinAnimation($target:MovieClip, $index:int):void
		{
			var rollSize:Number = 100;
			var targetX:Number = $target.x;
			var targetY:Number = $target.y;
//			trace("TWEEN 1");
			var tween:Tween = new Tween($target, SPIN_SPEED, Transitions.EASE_IN);
			tween.moveTo(targetX, targetY - rollSize);
			Starling.juggler.add(tween);			
			tween.onComplete = function():void { 
//				trace("TWEEN 2");
				var tween:Tween = new Tween($target, SPIN_SPEED, Transitions.LINEAR);
				$target.y = targetY + rollSize;
				tween.moveTo(targetX, targetY);
				Starling.juggler.add(tween);
				_slot1.currentFrame = ViewUtils.random(0,3);
				tween.onComplete = function():void {
//					trace("TWEEN 3");
					var tween:Tween = new Tween($target, SPIN_SPEED, Transitions.LINEAR);
					tween.moveTo(targetX, targetY - rollSize);
					Starling.juggler.add(tween);
					tween.onComplete = function():void { 
//						trace("TWEEN 4");
						var tween:Tween = new Tween($target, SPIN_SPEED, Transitions.EASE_OUT);
						$target.y = targetY + rollSize;
						tween.moveTo(targetX, targetY);
						Starling.juggler.add(tween);
						$target.currentFrame = _currentSpinData._values[$index];	
						tween.onComplete = function():void {
							//STOP SPIN
						};
					};
				};
			};
		}
		
		public function removeListeners():void
		{
			if (_spinTimer)
			{
				_spinTimer.removeEventListener(TimerEvent.TIMER, endSpin);
				_spinTimer.reset();
				_spinTimer = null;
			}
			
			ViewUtils.removeMovieClip(_slot1);
			ViewUtils.removeMovieClip(_slot2);
			ViewUtils.removeMovieClip(_slot3);
		}
	}
}