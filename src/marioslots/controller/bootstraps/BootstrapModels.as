package marioslots.controller.bootstraps
{
    import marioslots.controller.signals.ShowSpinAnimationSignal;
    import marioslots.model.LevelDataModel;
    import marioslots.model.MainModel;
    
    import org.robotlegs.core.IInjector;

    public class BootstrapModels
    {
        public function BootstrapModels(injector:IInjector)
        {
            injector.mapSingleton(MainModel);
			injector.mapSingleton(LevelDataModel);			
			injector.mapSingleton(ShowSpinAnimationSignal); // need to binding it 
        }
    }
}