package marioslots.model
{
    import ericfeminella.support.signals.binding.SignalDataBinding;
    
    import org.osflash.signals.Signal;
    import org.robotlegs.mvcs.Actor;
    
    import starling.utils.AssetManager;
    import marioslots.model.VO.SpinDataVO;

    public class MainModel extends Actor
    {
		private var _binding:SignalDataBinding = null;
		private var _progresChanged:Signal = null;
		private var _coinAtLevelChanged:Signal = null;
		private var _coinGlobalChanged:Signal = null;
		
		private var _levelProgres:Number = 0;
		
		public var _assets:AssetManager = new AssetManager();
		
		private var _coinsAtLevel:Number = 0;
		private var _coinsGlobal:Number = 0;
		public var _currentLevel:Number = 0;
		
		public var _spinData:SpinDataVO = new SpinDataVO();
		
		public function MainModel()
		{
			_assets.verbose = true;
			_binding = new SignalDataBinding();
			_progresChanged = new Signal();
			_coinAtLevelChanged = new Signal();
			_coinGlobalChanged = new Signal();
		}

		public function get currentLevel():Number 
		{ 
			return _currentLevel; 
		}
		
		public function set currentLevel($value:Number):void
		{
			_currentLevel = $value;
		}		
	
		public function get coinsGlobal():Number 
		{ 
			return _coinsGlobal; 
		}
		
		public function set coinsGlobal($value:Number):void
		{
			_coinsGlobal = $value;
			_coinGlobalChanged.dispatch( $value );
		}		
		
		public function get coinsAtLevel():Number 
		{ 
			return _coinsAtLevel; 
		}
		
		public function set coinsAtLevel($value:Number):void
		{
			_coinsAtLevel = $value;
			_coinAtLevelChanged.dispatch( $value );
		}		
		
		public function get levelProgres():Number 
		{ 
			return _levelProgres; 
		}
		
		public function set levelProgres($value:Number):void
		{
			_levelProgres = $value;
			_progresChanged.dispatch( $value );
		}
		
		public function addProgressBinding(host:*, property:*):void
		{
			_binding.addBindableListener(_progresChanged, host, property);
		}

		public function removeProgressBinding(host:*, property:*):void
		{
			_binding.removeBindableListener(_progresChanged, host, property);
		}		
		
		public function addAtLevelCoinBinding(host:*, property:*):void
		{
			_binding.addBindableListener(_coinAtLevelChanged, host, property);
		}
		
		public function removeAtLevelCoinBinding(host:*, property:*):void
		{
			_binding.removeBindableListener(_coinAtLevelChanged, host, property);
		}
		
		public function addGlobalCoinBinding(host:*, property:*):void
		{
			_binding.addBindableListener(_coinGlobalChanged, host, property);
			_coinGlobalChanged.dispatch( _coinsGlobal );
		}
		
		public function removeGlobalCoinBinding(host:*, property:*):void
		{
			_binding.removeBindableListener(_coinGlobalChanged, host, property);
		}		
	}
}