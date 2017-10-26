package marioslots.view.screenstates.game.platformer.levelObjects
{
	import starling.textures.Texture;
	import starling.utils.AssetManager;

	public class CoinsObjects extends DynamicRunableObjects
	{
		public function CoinsObjects()
		{
			SPEED = [1, 1, 1];			
		}
		
		public function addCoin($assets:AssetManager, $positionID:int):void
		{
			super.addObject(new <Texture>[$assets.getTexture("coin10000"), $assets.getTexture("coin20000"), $assets.getTexture("coin30000"), $assets.getTexture("coin40000")] , $positionID)
		}		
	}
}