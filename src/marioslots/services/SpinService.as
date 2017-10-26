package marioslots.services
{
	import marioslots.model.MainModel;
	import marioslots.view.ViewUtils;
	
	import org.robotlegs.mvcs.Actor;
	
	public class SpinService extends Actor
	{
		[Inject]
		public var _data:MainModel;	
		
		private var _values:Array = new Array();
		private var _addToField:Array = new Array();
		
		public function SpinService()
		{
		}

		public function get values():Array
		{
			return _values;
		}		
		
		public function set values($value:Array):void
		{
			_values = $value;
		}
		
		public function get addToField():Array
		{
			return _addToField;
		}		
		
		public function set addToField($value:Array):void
		{
			_addToField = $value;
		}
		
		public function getSpin():void
		{
			var index:int = ViewUtils.random(0, (_values.length-1));
			var valuesStr:String = _values[ index ];
			var addStr:String = _addToField[ index ];
			
			_data._spinData._values = valuesStr.split(",");
			_data._spinData._addToField = addStr.split(",");
		}
	}
}