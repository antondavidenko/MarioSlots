package marioslots
{
	import marioslots.controller.bootstraps.BootstrapCommands;
	import marioslots.controller.bootstraps.BootstrapModels;
	import marioslots.controller.bootstraps.BootstrapServices;
	import marioslots.controller.bootstraps.BootstrapViewMediators;
	import marioslots.controller.signals.StartupSignal;
	
	import org.osflash.signals.Signal;
	import org.robotlegs.mvcs.SignalStarlingContext;
	
	import starling.core.Starling;
	import starling.display.DisplayObjectContainer;

    public class MarioSlotsContext extends SignalStarlingContext
    {
		public var _contextStarlingView:Starling;
		
        public function MarioSlotsContext(contextView:DisplayObjectContainer=null, autoStartup:Boolean=true)
        {
            super(contextView, autoStartup);
        }
		
        override public function startup():void
        {
            new BootstrapModels(injector);
            new BootstrapServices(injector);
            new BootstrapCommands(signalCommandMap);
            new BootstrapViewMediators(mediatorMap);

            super.startup();
			
			(injector.getInstance(StartupSignal) as Signal).dispatch();
        }
    }
}