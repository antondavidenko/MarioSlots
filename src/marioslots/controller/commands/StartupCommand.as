package marioslots.controller.commands
{
    import marioslots.services.ResourcesLoaderService;
    import marioslots.view.screenstates.preloader.PreloaderView;
    
    import org.robotlegs.mvcs.StarlingSignalCommand;

    public class StartupCommand extends StarlingSignalCommand
    {
		[Inject]
		public var _resService:ResourcesLoaderService;
		
        override public function execute():void
        {
			addRootView();
			_resService.startLoad();
        }
		
        protected function addRootView():void
        {
			var preloaderView:PreloaderView = new PreloaderView();	
            contextView.addChild(preloaderView);
        }		
    }
}