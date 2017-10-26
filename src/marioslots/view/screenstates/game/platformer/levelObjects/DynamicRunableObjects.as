package marioslots.view.screenstates.game.platformer.levelObjects
{
	import marioslots.view.ViewUtils;
	
	import starling.animation.Transitions;
	import starling.animation.Tween;
	import starling.core.Starling;
	import starling.display.Image;
	import starling.display.MovieClip;
	import starling.display.Sprite;
	import starling.textures.Texture;

	public class DynamicRunableObjects extends Sprite
	{
		protected var SPEED:Array = [1, 1.5, 2];
		private const LEFT_POSITION:Number = -40; 
		
		protected var _imagesArray:Array = new Array;
		
		public function addObject($textures:Vector.<Texture>, $positionID:int):void
		{
			var objectView:MovieClip = ViewUtils.dropMovieClip($textures, 0, 0, this);
			var container:Sprite = this;
			
			var objX:Number = 550 + 150*$positionID; 
			var objY:Number = 340 - objectView.height	
			objectView.x = objX - 25;
			objectView.y = objY + 140;
			objectView.scaleX = objectView.scaleY = 2;
			
			var tween:Tween = new Tween(objectView, 0.5, Transitions.EASE_IN);
			tween.moveTo(objX, objY - 200);
			tween.scaleTo(1); 			
			tween.onComplete = function():void { 
				var tween:Tween = new Tween(objectView, 0.25, Transitions.EASE_OUT);
				tween.moveTo(objX, objY);
				Starling.juggler.add(tween);
				tween.onComplete = function():void { 
					container.removeChild(objectView); 
					dropOnField($textures, $positionID); 
				}
			};
			Starling.juggler.add(tween);
		}
		
		public function dropOnField($textures:Vector.<Texture>, $positionID:int):void
		{
			var image:MovieClip = ViewUtils.dropMovieClip($textures, 0, 0, this);
			image.x = 550 + 150*$positionID;
			image.y = 340 - image.height;
			image.name = String(ViewUtils.random(0,2));
			_imagesArray.push(image);			
		}
		
		public function update():void
		{
			var i:int = 0;
			var image:Image;
			
			for (i=0; i < _imagesArray.length  ;i++)
			{
				image = _imagesArray[i];
				if ( image.x < LEFT_POSITION)
				{
					this.removeChild(image);
					_imagesArray.shift();
				}
				else
				{
					image.x -= SPEED[int(image.name)];
				}
			}
		}
		
		public function getBoundsList():Array
		{
			var i:int = 0;
			var result:Array = new Array(); 
			
			for (i=0; i < _imagesArray.length  ;i++)
			{
				result.push( _imagesArray[i].bounds )
			}
			
			return result;
		}
		
		public function removeItemByID(id:int):void
		{
			var image:Image;
			
			image = _imagesArray[id];
			this.removeChild(image);
			_imagesArray = removeDyIndex(_imagesArray, id);
		}
		
		protected function removeDyIndex(target:Array, index:int):Array
		{
			var arr1:Array = target.slice(0,index);
			var arr2:Array = target.slice(index+1, target.length);
			return arr1.concat(arr2);
		}		
	}
}