package marioslots.view.screenstates.game.platformer
{
	import flash.geom.Rectangle;
	
	import marioslots.view.ViewUtils;
	
	import org.osflash.signals.Signal;
	
	import starling.animation.Transitions;
	import starling.animation.Tween;
	import starling.core.Starling;
	import starling.display.Image;
	import starling.display.MovieClip;
	import starling.display.Sprite;
	import starling.textures.Texture;
	import starling.utils.AssetManager;

	public class HeroView extends Sprite
	{
		private var _inAir:Boolean = false;
		private var _isDead:Boolean = false;
		
		private var _hero:MovieClip;
		private var _heroDie:Image;
		private var _heroWin:Image;
		private var _heroJump:Image;			
		
		public var _dieAnimationEndSignal:Signal = new Signal();
		
		public function HeroView()
		{
		}
		
		public function get inAir():Boolean
		{
			return _inAir;
		}

		public function drawScreen($assets:AssetManager):void
		{
			var _walk1Texture:Texture = $assets.getTexture("mario_walk10000");
			var _walk2Texture:Texture = $assets.getTexture("mario_walk20000");
			
			_hero = ViewUtils.dropMovieClip(new <Texture>[_walk1Texture, _walk1Texture, _walk2Texture, _walk2Texture], 50, 295, this);
			_hero.play();
			
			_heroDie = ViewUtils.dropImage($assets.getTexture("mario_die0000"), 50, 295, this);
			_heroDie.visible = false;
			
			_heroWin = ViewUtils.dropImage($assets.getTexture("mario_stand0000"), 50, 295, this);
			_heroWin.visible = false;	
			
			_heroJump = ViewUtils.dropImage($assets.getTexture("mario_jump0000"), 50, 295, this);
			_heroJump.visible = false;
		}
		
		public function doJump():void
		{
			if (!_inAir && !_isDead)
			{
				var heroX:Number = _hero.x; 
				var heroY:Number = _hero.y;	
				_hero.visible = false;
				_heroJump.visible = true;
				_inAir = true;
				
				var tween:Tween = new Tween(_heroJump, 0.4, Transitions.EASE_OUT);
				tween.moveTo(heroX, heroY - 150);
				tween.onComplete = function():void { 
					var tween:Tween = new Tween(_heroJump, 0.4, Transitions.EASE_IN);
					tween.moveTo(heroX, heroY);
					Starling.juggler.add(tween);
					tween.onComplete = function():void { 
						_hero.visible = true;
						_heroJump.visible = false;
						_inAir = false;
					}
				};
				Starling.juggler.add(tween);
			}
		}
		
		public function doDie():void
		{
			if (!_inAir && !_isDead)
			{
				var heroX:Number = _hero.x; 
				var heroY:Number = _hero.y;	
				_hero.pause();
				_isDead = true;
				_hero.visible = false;
				_heroDie.visible = true;
				
				var tween:Tween = new Tween(_heroDie, 0.25, Transitions.EASE_OUT);
				tween.moveTo(heroX, heroY - 150);
				tween.onComplete = function():void { 
					var tween:Tween = new Tween(_heroDie, 1, Transitions.EASE_IN);
					tween.moveTo(heroX, heroY + 400);
					Starling.juggler.add(tween);
					tween.onComplete = function():void { 
						_dieAnimationEndSignal.dispatch();
					}
				};
				Starling.juggler.add(tween);
			}
		}	
		
		public function doWin():void
		{
			_hero.visible = false;
			_heroWin.visible = true;
		}			
		
		public function removeListeners():void
		{
			ViewUtils.removeMovieClip(_hero);
		}
		
		public function getHeroBounds():Rectangle
		{
			var result:Rectangle;
			if ( _inAir )
			{
				result = _heroJump.bounds;
			} 
				else if ( _isDead )
			{
				result = new Rectangle();
			} 
				else
			{
				result = _hero.bounds;
			}
			return result;
		}
	}
}