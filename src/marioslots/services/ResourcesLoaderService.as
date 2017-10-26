package marioslots.services {
	import marioslots.controller.signals.SwitchScreenStateSignal;
	import marioslots.model.LevelDataModel;
	import marioslots.model.MainModel;
	import marioslots.model.VO.ScreenStateClassVO;
	import marioslots.view.screenstates.lobby.LobbyView;
	
	import org.robotlegs.mvcs.Actor;

	public class ResourcesLoaderService extends Actor
	{
		public static const MAIN_PNG:String= "./assets/main.png";
		public static const MAIN_XML:String= "./assets/main.xml";
		
		public static const LEVELS_XML:String= "./assets/levels.xml";
		public static const LEVELS_XML_ASSET:String= "levels";

		public static const TRACK_SOUND:String= "./assets/track.mp3";
		public static const WIN_SOUND:String= "./assets/win.mp3";		
		
		[Inject]
		public var _mainModel:MainModel;
		
		[Inject]
		public var _levelsModel:LevelDataModel;		

		[Inject]
		public var _switchStateSignal:SwitchScreenStateSignal;
	
		public function ResourcesLoaderService()
		{
		}
		
		public function startLoad():void
		{
			_mainModel._assets.enqueue(MAIN_PNG);
			_mainModel._assets.enqueue(MAIN_XML);
			_mainModel._assets.enqueue(LEVELS_XML);
			_mainModel._assets.enqueue(TRACK_SOUND);
			_mainModel._assets.enqueue(WIN_SOUND);
			
			_mainModel._assets.loadQueue(function(ratio:Number):void
			{
				//trace("Loading assets, progress:", ratio);
				
				if (ratio == 1.0)
				{
					loadComplete();
				}
			});			
		}
		
		private function loadComplete():void {
			_switchStateSignal.dispatch(new ScreenStateClassVO(LobbyView));
			_levelsModel.setupData(_mainModel._assets.getXml(LEVELS_XML_ASSET));
		}
	}
}