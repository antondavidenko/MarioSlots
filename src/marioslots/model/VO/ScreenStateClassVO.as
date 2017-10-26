package marioslots.model.VO
{
	public class ScreenStateClassVO
	{
		private var _data:Class;
		private var _params:String;
		
		public function ScreenStateClassVO($value:Class, $params:String = "")
		{
			_data = $value;	
			_params = $params;
		}

		public function get params():String
		{
			return _params;
		}
		
		public function set params($value:String):void
		{
			_params = $value;
		}	
		
		public function get data():Class
		{
			return _data;
		}
		
		public function set data($value:Class):void
		{
			_data = $value;
		}		
	}
}