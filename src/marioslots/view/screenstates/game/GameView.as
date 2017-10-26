package marioslots.view.screenstates.game
{
	import flash.media.Sound;
	import flash.media.SoundChannel;
	
	import marioslots.view.AbstractView;
	import marioslots.view.ViewUtils;
	import marioslots.view.screenstates.game.platformer.PlatformerView;
	import marioslots.view.screenstates.game.slot.SlotView;
	
	import starling.core.Starling;
	import starling.display.Button;
	import starling.display.Image;
	import starling.display.MovieClip;
	import starling.display.Quad;
	import starling.events.Event;
	import starling.text.TextField;
	import starling.textures.Texture;
	import starling.utils.Color;
	
	public class GameView extends AbstractView
	{
		public var _platformer:PlatformerView = new PlatformerView();
		public var _slot:SlotView = new SlotView();
		
		private var _coinsTextField:TextField;
		
		private var _progress:MovieClip;

		private var _jumpButton:Button;
		
		public var _levelLen:int;
		
		private var _track:Sound;
		private var _channel:SoundChannel = new SoundChannel();
		
		private var _isPaused:Boolean = false;

		[Embed(source="./../../../../../resources/PipeDream.ttf", embedAsCFF="false", fontFamily="PipeDream")]
		private static const PipeDream:Class;

		public function setPause($setPause:Boolean):void
		{
			_isPaused = $setPause;
			_slot.setPause($setPause);
		}
		
		override public function drawScreen():void
		{
			_track = _assets.getSound("track");
			_channel = _track.play(0,30);
			
			var quad:Quad = new Quad(960, 640, Color.rgb(96,147,254) );
			quad.x = 0;
			quad.y = 0;
			addChild(quad);
			
			var bgImage:Image = ViewUtils.dropImage(_assets.getTexture("gameBg0000"), 0, 385, this);
			
			_jumpButton = ViewUtils.dropTextButton(_assets.getTexture("jumpButton0000"), "", 40, 400, this, onJumpButtonTriggered);
			
			_platformer.drawScreen(_assets);
			_platformer._onWinSignal.add(doWin);
			addChild(_platformer);
			
			_slot.drawScreen(_assets);
			addChild(_slot);
			
			_coinsTextField = new TextField(140, 60, "000", "PipeDream", 48, Color.WHITE);
			//_coinsTextField.border = true;
			_coinsTextField.x = 340;
			_coinsTextField.y = 410;
			addChild(_coinsTextField);
			
			this.addEventListener(Event.ENTER_FRAME, updateGameStage);
			
			drawLevelMap();
			
			_progress = ViewUtils.dropMovieClip(new <Texture>[_assets.getTexture("mario_walk10000"), _assets.getTexture("mario_walk10000"), _assets.getTexture("mario_walk20000"), _assets.getTexture("mario_walk20000")], 130, 570, this);
			_progress.play();
		}
		
		private function doWin():void
		{
			_channel.stop();
			_track = _assets.getSound("win");
			_channel = _track.play();			
		}		
		
		private function drawLevelMap():void
		{
			var i:int = 0;
			var quad:Quad;
			var width:int = 63 * 10/_levelLen;
			var heiht:int = 5;
			var border:int = 10 * 10/_levelLen;

			for (i=0; i<_levelLen; i++)
			{
				quad = new Quad(width, heiht, Color.rgb(0,0,0) );
				quad.x = 120 + width*i + border*i;
				quad.y = 620;
				addChild(quad);
			}
		}

		public function setupProgres($progres:Number):void
		{
			_progress.x = int(100 + 30*(10/_levelLen) + $progres * 73 * 10/_levelLen);
		}		
		
		public function setupCoinsTextField($score:Number):void
		{
			if ($score<10)
			{
				_coinsTextField.text = "00" + String($score);
			}
			else
			{
				_coinsTextField.text = "0" + String($score);
			}
		}
		
		private function updateGameStage(e:Event):void
		{
			if (!_isPaused)
			{
				_platformer.update();
			}
		}
		
		private function onJumpButtonTriggered(event:Event):void
		{
			_platformer.heroDoJump();
		}		
		
		public function removeListeners():void
		{
			this.removeEventListener(Event.ENTER_FRAME, updateGameStage);
			
			ViewUtils.removeMovieClip(_progress);
			
			_slot.removeListeners();
			_platformer.removeListeners();
			
			Starling.juggler.purge();
			_channel.stop();
		}		
	}
}