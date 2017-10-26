package marioslots.controller.bootstraps
{
    import marioslots.view.CollisionDetection;
    import marioslots.services.ResourcesLoaderService;
    import marioslots.services.SpinService;
    
    import org.robotlegs.core.IInjector;

    public class BootstrapServices
    {

        public function BootstrapServices(injector:IInjector)
        {
            //injector.mapSingletonOf(IMosaicConfigLoadingService, MosaicConfigSolLoadingService);
			injector.mapSingleton(ResourcesLoaderService);
			injector.mapSingleton(SpinService);
        }
    }
}