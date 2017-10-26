package marioslots.view
{
	import starling.core.Starling;
	import starling.display.Button;
	import starling.display.DisplayObjectContainer;
	import starling.display.Image;
	import starling.display.MovieClip;
	import starling.events.Event;
	import starling.text.TextField;
	import starling.textures.Texture;
	import starling.utils.Color;

	public class ViewUtils
	{
		public function ViewUtils()
		{
		}
		
		public static function dropImage($texture:Texture, $x:int, $y:int, $parent:DisplayObjectContainer):Image
		{
			var image:Image = new Image($texture);
			image.x = $x;
			image.y = $y;	
			$parent.addChild(image);
			return image;
		}
		
		public static function dropMovieClip($textures:Vector.<Texture>, $x:int, $y:int, $parent:DisplayObjectContainer):MovieClip
		{
			var mc:MovieClip = new MovieClip($textures);
			mc.x = $x;
			mc.y = $y;	
			$parent.addChild(mc);
			Starling.juggler.add(mc);
			return mc;
		}	
		
		public static function removeMovieClip($mc:MovieClip):void
		{
			Starling.juggler.remove($mc);
			$mc.dispose();
		}
		
		public static function dropButton($texture:Texture, $x:int, $y:int, $parent:DisplayObjectContainer, $onButtonTriggered:Function):Button
		{
			var buttonImage:Button = new Button($texture);	
			buttonImage.x = $x;
			buttonImage.y = $y;			
			$parent.addChild(buttonImage);
			buttonImage.addEventListener(Event.TRIGGERED, $onButtonTriggered);
			return buttonImage;
		}
		
		public static function dropTextButton($texture:Texture, $text:String, $x:int, $y:int, $parent:DisplayObjectContainer, $onButtonTriggered:Function):Button
		{
			var buttonImage:Button = new Button($texture);	
			buttonImage.x = $x;
			buttonImage.y = $y;			
			$parent.addChild(buttonImage);
			buttonImage.addEventListener(Event.TRIGGERED, $onButtonTriggered);
			
			var textField:TextField = new TextField(buttonImage.width, buttonImage.height, $text, "PipeDream", 24, Color.BLACK);
			buttonImage.addChild(textField);			
			
			return buttonImage;
		}		
		
		public static function random(min:int, max:int):int {
			return Math.round(Math.random() * (max - min) + min);
		}
	}
}