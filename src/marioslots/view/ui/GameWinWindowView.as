package marioslots.view.ui
{
	import marioslots.view.ViewUtils;
	
	import starling.events.Event;
	import starling.text.TextField;
	import starling.textures.Texture;
	import starling.utils.Color;

	public class GameWinWindowView extends AbstractWindowView
	{
		public function GameWinWindowView()
		{
		}
		
		override public function drawScreen():void
		{	
			_dialogWindow = ViewUtils.dropMovieClip(new <Texture>[_assets.getTexture("dialog_window0000")], 250, 370, this);
			_dialogText = new TextField(430, 100, "", "PipeDream", 24, Color.WHITE);
			_dialogText.x = 250;
			_dialogText.y = 400;
			addChild(_dialogText);
			_okButton = ViewUtils.dropTextButton(_assets.getTexture("smallButton0000"), "OK", 410, 530, this, onOkButtonTriggered);		
		}
		
		public function setBonusInfo(lvlBonus:int, lvlCollect:int):void
		{
			_dialogText.text = "You WIN!\rComplete bonus: "+lvlBonus+"\rCollect on level:"+lvlCollect;	
		}
		
		private function onOkButtonTriggered(event:Event):void
		{
			_clickSignal.dispatch();
		}		
		
		public function removeListeners():void
		{
			_okButton.removeEventListener(Event.TRIGGERED, onOkButtonTriggered);
		}			
	}
}