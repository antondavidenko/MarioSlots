package marioslots.view.screenstates.game.platformer
{
	import marioslots.view.ViewUtils;
	
	import starling.display.Sprite;
	import starling.utils.AssetManager;

	public class TrackView extends Sprite
	{
		private var _groundImagesRun:RunableObjects;
		private var _cloudBigImagesRun:RunableObjects;
		private var _cloudSmalImagesRun:RunableObjects;
		private var _grassImagesRun:RunableObjects;
		private var _mountImagesRun:RunableObjects;
		private var _farMountImagesRun:RunableObjects;
		
		private var _castleRun:RunableObjects;
		private var _flagHolder:RunableObjects;
		private var _flag:RunableObjects;
		
		private var _assets:AssetManager;
		
		public function TrackView()
		{
		}
		
		public function drawScreen($assets:AssetManager):void
		{
			initCloudSmal($assets);			
			initFarMount($assets);	
			initMount($assets);			
			initGround($assets);
			initGrass($assets);
			initCloudBig($assets);
		}

		public function addCastle():void
		{
			_castleRun = new RunableObjects([_assets.getTexture("castle0000")], 1, -1);
			_castleRun._getDefaultX = function(i:int, width:int):int {return 960 + 400;};			
			_castleRun._getDefaultY = function(i:int, height:int):int {return 342-height;};
			_castleRun._getNewX = function(width:int):int {return 960 + 400;};
			_castleRun._getNewY = function(height:int):int {return 340-height;};
			_castleRun.draw();
			this.addChild(_castleRun);
			
			_flagHolder = new RunableObjects([_assets.getTexture("flag_holder0000")], 1, -1);
			_flagHolder._getDefaultX = function(i:int, width:int):int {return 960 + 100;};			
			_flagHolder._getDefaultY = function(i:int, height:int):int {return 342-height;};
			_flagHolder._getNewX = function(width:int):int {return 960 + 100;};
			_flagHolder._getNewY = function(height:int):int {return 340-height;};
			_flagHolder.draw();
			this.addChild(_flagHolder);
			
			_flag = new RunableObjects([_assets.getTexture("flag0000")], 1, -1);
			_flag._getDefaultX = function(i:int, width:int):int {return 960 + 100 + 47;};			
			_flag._getDefaultY = function(i:int, height:int):int {return 342-height-35;};
			_flag._getNewX = function(width:int):int {return 960 + 100;};
			_flag._getNewY = function(height:int):int {return 340-height;};
			_flag.draw();
			this.addChild(_flag);				
		}		
		
		private function initFarMount($assets:AssetManager):void
		{
			_assets = $assets;
			
			_farMountImagesRun = new RunableObjects([$assets.getTexture("farMount_10000"), $assets.getTexture("farMount_20000")], 6, -0.25);
			_farMountImagesRun._getDefaultX = function(i:int, width:int):int {return ViewUtils.random(0,960*2);};			
			_farMountImagesRun._getDefaultY = function(i:int, height:int):int {return 340-height;};
			_farMountImagesRun._getNewX = function(width:int):int {return ViewUtils.random(0,960)+960;};
			_farMountImagesRun._getNewY = function(height:int):int {return 340-height;};
			_farMountImagesRun.draw();
			this.addChild(_farMountImagesRun);	
		}		
		
		private function initMount($assets:AssetManager):void
		{
			_mountImagesRun = new RunableObjects([$assets.getTexture("mount_10000"), $assets.getTexture("mount_20000"), $assets.getTexture("mount_30000"), $assets.getTexture("mount_40000")], 6, -0.5);
			_mountImagesRun._getDefaultX = function(i:int, width:int):int {return ViewUtils.random(0,960*2);};			
			_mountImagesRun._getDefaultY = function(i:int, height:int):int {return 340-height;};
			_mountImagesRun._getNewX = function(width:int):int {return ViewUtils.random(0,960)+960;};
			_mountImagesRun._getNewY = function(height:int):int {return 340-height;};
			_mountImagesRun.draw();
			this.addChild(_mountImagesRun);	
		}		
		
		private function initGrass($assets:AssetManager):void
		{
			_grassImagesRun = new RunableObjects([$assets.getTexture("grass_10000"), $assets.getTexture("grass_20000")], 6, -1);
			_grassImagesRun._getDefaultX = function(i:int, width:int):int {return ViewUtils.random(0,960*2);};			
			_grassImagesRun._getDefaultY = function(i:int, height:int):int {return 340-height;};
			_grassImagesRun._getNewX = function(width:int):int {return ViewUtils.random(0,960)+960;};
			_grassImagesRun._getNewY = function(height:int):int {return 340-height;};
			_grassImagesRun.draw();
			this.addChild(_grassImagesRun);	
		}
		
		private function initCloudSmal($assets:AssetManager):void
		{
			_cloudSmalImagesRun = new RunableObjects([$assets.getTexture("cloud_smal0000")], 14, -0.5);
			_cloudSmalImagesRun._getDefaultX = function(i:int, width:int):int {return ViewUtils.random(0,960*2);};
			_cloudSmalImagesRun._getDefaultY = function(i:int, height:int):int {return ViewUtils.random(0,120);};
			_cloudSmalImagesRun._getNewX = function(width:int):int {return ViewUtils.random(0,960)+960;};
			_cloudSmalImagesRun._getNewY = function(height:int):int {return ViewUtils.random(0,120);};			
			_cloudSmalImagesRun.draw();
			this.addChild(_cloudSmalImagesRun);
		}
		
		private function initCloudBig($assets:AssetManager):void
		{
			_cloudBigImagesRun = new RunableObjects([$assets.getTexture("cloud_big0000")], 4, -1);
			_cloudBigImagesRun._getDefaultX = function(i:int, width:int):int {return ViewUtils.random(0,960*2);};
			_cloudBigImagesRun._getDefaultY = function(i:int, height:int):int {return ViewUtils.random(0,80);};
			_cloudBigImagesRun._getNewX = function(width:int):int {return ViewUtils.random(0,960)+960;};
			_cloudBigImagesRun._getNewY = function(height:int):int {return ViewUtils.random(0,80);};			
			_cloudBigImagesRun.draw();
			this.addChild(_cloudBigImagesRun);		
		}
		
		private function initGround($assets:AssetManager):void
		{
			_groundImagesRun = new RunableObjects([$assets.getTexture("ground0000")], 22, -1);
			_groundImagesRun._getDefaultX = function(i:int, width:int):int {return 48*i;};			
			_groundImagesRun._getDefaultY = function(i:int, height:int):int {return 340;};
			_groundImagesRun._getNewX = function(width:int):int {return 48*21-2};
			_groundImagesRun._getNewY = function(height:int):int {return 340;};
			_groundImagesRun.draw();
			this.addChild(_groundImagesRun);				
		}		
		
		public function update(isRun:Boolean = true):void
		{
			_cloudBigImagesRun.update();
			_cloudSmalImagesRun.update();
			
			if (isRun) 
			{
				_groundImagesRun.update();
				_grassImagesRun.update();
				_mountImagesRun.update();
				_farMountImagesRun.update();
				if (_castleRun)
				{
					_castleRun.update();
					_flagHolder.update();
					_flag.update();
				}
			}
		}
		
		public function get flag():Sprite
		{
			return Sprite(_flag);
		}
	}
}