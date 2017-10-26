package marioslots.model.VO
{
	public class GameItemVO
	{
		public static const COIN:String = "coin";		
		
		private var _data:String;
		
		public function GameItemVO($value:String)
		{
			_data = $value;
		}
		
		public function get data():String
		{
			return _data;
		}
		
		public function set data($value:String):void
		{
			_data = $value;
		}		
	}
}