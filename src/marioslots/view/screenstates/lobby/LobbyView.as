package marioslots.view.screenstates.lobby
{
	import marioslots.view.AbstractView;
	import marioslots.view.ViewUtils;
	
	import org.osflash.signals.Signal;
	
	import starling.display.Button;
	import starling.display.Image;
	import starling.display.Quad;
	import starling.events.Event;
	import starling.text.TextField;
	import starling.textures.Texture;
	import starling.utils.Color;

	public class LobbyView extends AbstractView
	{
		public var _bgTexture:Texture;
		public var _bigButtonTexture:Texture;
		
		public var clickSignal:Signal = new Signal();
		
		private var _gameButton1:Button;
		private var _gameButton2:Button;
		private var _gameButton3:Button;
		private var _gameButton4:Button;
		private var _gameButton5:Button;
		
		private var _coinsTextField:TextField;		
		
		override public function drawScreen():void
		{
			_bgTexture = _assets.getTexture("menuBg0000");
			_bigButtonTexture = _assets.getTexture("smallButton0000");
			
			var quad:Quad = new Quad(960, 640, Color.rgb(96,147,254) );
			quad.x = 0;
			quad.y = 0;
			addChild(quad);

			var bgImage:Image = ViewUtils.dropImage(_bgTexture, 0, 0, this);
			
			_gameButton1 = ViewUtils.dropTextButton(_bigButtonTexture, "Level 1", 205, 410, this, onGameButtonTriggered);
			_gameButton1.name = "1";
			
			_gameButton2 = ViewUtils.dropTextButton(_bigButtonTexture, "Level 2", 120, 225, this, onGameButtonTriggered);
			_gameButton2.name = "2";
			
			_gameButton3 = ViewUtils.dropTextButton(_bigButtonTexture, "Level 3", 500, 185, this, onGameButtonTriggered);
			_gameButton3.name = "3";

			_gameButton4 = ViewUtils.dropTextButton(_bigButtonTexture, "Level 4", 700, 265, this, onGameButtonTriggered);
			_gameButton4.name = "4";
			
			_gameButton5 = ViewUtils.dropTextButton(_bigButtonTexture, "Level 5", 500, 400, this, onGameButtonTriggered);
			_gameButton5.name = "5";			
			
			_coinsTextField = new TextField(350, 60, "", "PipeDream", 24, Color.BLACK);
			//_coinsTextField.border = true;
			_coinsTextField.x = 0;
			_coinsTextField.y = 0;
			addChild(_coinsTextField);
		}
		
		public function set updateBalanceView($balance:Number):void
		{
			_coinsTextField.text = "Your coins balance: " + String($balance);
		}

		private function onGameButtonTriggered(event:Event):void
		{
			//clickSignal.dispatch(ButtonsEnum.GAME + "_lvl_" + (event.target as Button).name );
			clickSignal.dispatch( (event.target as Button).name );
		}
		
		public function removeListeners():void
		{
			_gameButton1.removeEventListener(Event.TRIGGERED, onGameButtonTriggered);
			_gameButton2.removeEventListener(Event.TRIGGERED, onGameButtonTriggered);
			_gameButton3.removeEventListener(Event.TRIGGERED, onGameButtonTriggered);
		}		
	}
}