package marioslots.controller.bootstraps
{
    import marioslots.view.GameViewMediator;
    import marioslots.view.screenstates.game.GameView;
    import marioslots.view.screenstates.lobby.LobbyView;
    import marioslots.view.screenstates.lobby.LobbyViewMediator;
    import marioslots.view.screenstates.preloader.PreloaderView;
    import marioslots.view.screenstates.preloader.PreloaderViewMediator;
    import marioslots.view.ui.GameLoseWindowMediator;
    import marioslots.view.ui.GameLoseWindowView;
    import marioslots.view.ui.GameWinWindowMediator;
    import marioslots.view.ui.GameWinWindowView;
    
    import org.robotlegs.core.IStarlingMediatorMap;

    public class BootstrapViewMediators extends Object
    {
        public function BootstrapViewMediators(mediatorMap:IStarlingMediatorMap)
        {
            mediatorMap.mapView(PreloaderView, 	PreloaderViewMediator);
            mediatorMap.mapView(LobbyView, 		LobbyViewMediator);
			mediatorMap.mapView(GameView, 		GameViewMediator);
			
			mediatorMap.mapView(GameWinWindowView, 	GameWinWindowMediator);
			mediatorMap.mapView(GameLoseWindowView, GameLoseWindowMediator);
        }
    }
}