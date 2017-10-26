package marioslots.model
{
	import ericfeminella.support.signals.binding.SignalDataBinding;
	
	import org.osflash.signals.Signal;

	public class LevelDataModel extends LevelsDataParser
	{
		public var _maxSteps:Number; // need to be private
		private var _lvlBounty:Number;

		private var _binding:SignalDataBinding = null;		
		private var _lvlBonusChanged:Signal = null;				
		
		public function LevelDataModel()
		{
			_binding = new SignalDataBinding();			
			_lvlBonusChanged = new Signal();				
		}
		
		public function setupLevel(levelId:int):void
		{
			maxSteps = levelLenById(levelId) - 1;
			_lvlBounty = levelBountyById(levelId);
		}
		
		public function get maxSteps():Number 
		{ 
			return _maxSteps; 
		}
		
		public function set maxSteps($value:Number):void
		{
			_maxSteps = $value;
			_lvlBonusChanged.dispatch( $value );
		}		
		
		public function addBonusBinding(host:*, property:*):void
		{
			_binding.addBindableListener(_lvlBonusChanged, host, property);
			_lvlBonusChanged.dispatch( _lvlBounty );
		}
		
		public function removeBonusBinding(host:*, property:*):void
		{
			_binding.removeBindableListener(_lvlBonusChanged, host, property);
		}		
	}
}