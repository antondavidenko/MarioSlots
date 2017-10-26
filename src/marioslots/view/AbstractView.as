package marioslots.view
{
	import starling.display.Sprite;
	import starling.utils.AssetManager;

	public class AbstractView extends Sprite
	{
		protected var _assets:AssetManager;		
		
		public function AbstractView()
		{
		}
		
		public function get assets():AssetManager
		{
			return _assets;
		}		
		
		public function set assets($assets:AssetManager):void
		{
			_assets = $assets;
			drawScreen();
		}
		
		public function drawScreen():void
		{
		
		}
	}
}