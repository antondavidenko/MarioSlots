package marioslots.view.screenstates.game.platformer.levelObjects
{
	import starling.display.MovieClip;
	import starling.textures.Texture;
	import starling.utils.AssetManager;

	public class EnemyObjects extends DynamicRunableObjects
	{
		private var _assets:AssetManager;
		
		public function EnemyObjects()
		{
			SPEED = [1.5, 1.5, 1.5];			
		}
		
		public function addEnemy($assets:AssetManager, $positionID:int):void
		{	
			_assets = $assets;
			super.addObject(new <Texture>[$assets.getTexture("enemy1_walk10000"), $assets.getTexture("enemy1_walk10000"), $assets.getTexture("enemy1_walk20000"), $assets.getTexture("enemy1_walk20000")] , $positionID)
		}
		
		override public function removeItemByID(id:int):void
		{
			var image:MovieClip;
			image = _imagesArray[id];
			
			if(image.numFrames>1)
			{
				image.removeFrameAt(1);
				image.removeFrameAt(1);				
				image.removeFrameAt(1);
			}
			
			image.setFrameTexture(0, _assets.getTexture("enemy1_die0000"));
			//this.removeChild(image);
			//_imagesArray = removeDyIndex(_imagesArray, id);
		}

		override public function getBoundsList():Array
		{
			var i:int = 0;
			var result:Array = new Array(); 
			
			for (i=0; i < _imagesArray.length  ;i++)
			{
				if (_imagesArray[i].numFrames == 4)
				{
					result.push( _imagesArray[i].bounds );
				}
			}
			
			return result;
		}		
	}
}