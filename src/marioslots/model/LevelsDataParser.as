package marioslots.model
{
	import org.robotlegs.mvcs.Actor;

	public class LevelsDataParser extends Actor
	{
		protected var _data:XML;
		
		public function LevelsDataParser()
		{
		}
		
		public function setupData($data:XML):void
		{
			_data = $data;
		}
		
		public function levelBountyById($id:int):int
		{
			var i:int=0;
			var result:int;
			
			for (i=0; i<_data.children().length(); i++ )
			{
				if (String($id) == String(_data.children()[i].attribute("id")))
				{
					result = _data.children()[i].attribute("bounty");
					break;
				}
			}
			
			return result;
		}
		
		public function levelLenById($id:int):int
		{
			var i:int=0;
			var result:int;
			
			for (i=0; i<_data.children().length(); i++ )
			{
				if (String($id) == String(_data.children()[i].attribute("id")))
				{
					result = _data.children()[i].attribute("lenght");
					break;
				}
			}
			
			return result;
		}
		
		public function levelValuesById($id:int):Array
		{
			var i:int=0;
			var j:int=0;
			var result:Array = new Array();
			
			for (i=0; i<_data.children().length(); i++ )
			{
				if (String($id) == String(_data.children()[i].attribute("id")))
				{
					for (j=0; j<_data.children()[i].children().length(); j++ )
					{
						result.push(_data.children()[i].children()[j].attribute("values"));
					}
					break;
				}
			}
			
			return result;
		}
		
		public function levelAddItemsById($id:int):Array
		{
			var i:int=0;
			var j:int=0;
			var result:Array = new Array();
			
			for (i=0; i<_data.children().length(); i++ )
			{
				if (String($id) == String(_data.children()[i].attribute("id")))
				{
					for (j=0; j<_data.children()[i].children().length(); j++ )
					{
						result.push(_data.children()[i].children()[j].attribute("add"));
					}
					break;
				}
			}
			
			return result;
		}
	}
}