package marioslots.view.screenstates.preloader 
{
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;

	public class PreloaderView extends Sprite
	{
		[Embed(source="./../../../../../resources/preloader.xml", mimeType="application/octet-stream")]
		public static const AtlasXml:Class;
		
		[Embed(source="./../../../../../resources/preloader.png")]
		public static const AtlasTexture:Class;		
		
		public function PreloaderView()
		{
			super();			
			
			trace("IN PRELOADER!");
			
			// create atlas
			var texture:Texture = Texture.fromBitmap(new AtlasTexture());
			var xml:XML = XML(new AtlasXml());
			var atlas:TextureAtlas = new TextureAtlas(texture, xml);
			
			// display a sub-texture
			var bgTexture:Texture = atlas.getTexture("loaderBG0000");
			var bgImage:Image = new Image(bgTexture);
			addChild(bgImage);			
			
			var wheelTexture:Texture = atlas.getTexture("wheel0000");
			var wheelImage:Image = new Image(wheelTexture);	
			wheelImage.x = 450;
			wheelImage.y = 400;			
			addChild(wheelImage);
		}
	}
}