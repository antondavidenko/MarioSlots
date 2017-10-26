package marioslots.view.screenstates.game.platformer
{
	import marioslots.view.ViewUtils;
	
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.textures.Texture;

	public class RunableObjects extends Sprite
	{
		private var _count:int;
		private var _texrures:Array;
		private var _speed:Number;
		private var _imagesArray:Array = new Array;
		
		public var _getDefaultY:Function;
		public var _getDefaultX:Function;
		public var _getNewY:Function;
		public var _getNewX:Function;
		
		public function RunableObjects($texrure:Array, $count:int, $speed:Number)
		{
			_count = $count;
			_texrures = $texrure;
			_speed = $speed;
		}
		
		public function draw():void
		{
			var i:int;
			var texrure:Texture;
			var index:int;
			for (i=0; i<_count; i++) 
			{
				index = ViewUtils.random(0, _texrures.length-1);
				texrure = _texrures[index];
				_imagesArray[i] = ViewUtils.dropImage(texrure, 0, 0, this);
				_imagesArray[i].x = _getDefaultX.call(null, i, Image(_imagesArray[i]).width);
				_imagesArray[i].y = _getDefaultY.call(null, i, Image(_imagesArray[i]).height);
			}			
		}
		
		public function update():void
		{
			var i:int;
			
			for (i=0; i<_count; i++) 
			{
				if (_imagesArray[i].x <= Image(_imagesArray[i]).width*(-1) )
				{
					_imagesArray[i].x = _getNewX.call(null, Image(_imagesArray[i]).width);
					_imagesArray[i].y = _getNewY.call(null, Image(_imagesArray[i]).height);
				}
				else
				{
					_imagesArray[i].x += _speed;
				}
			}
		}
	}
}