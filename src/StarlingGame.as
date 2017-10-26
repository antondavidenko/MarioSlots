package
{
	import marioslots.MarioSlotsContext;
	
	import starling.display.Sprite;
	
	public class StarlingGame extends Sprite
	{
		private var _context:MarioSlotsContext;		
		
		public function StarlingGame()
		{
			super();
			
			_context = new MarioSlotsContext(this);
		}
	}
}