package marioslots.controller.bootstraps
{
    import marioslots.controller.commands.CloseWindowCommand;
    import marioslots.controller.commands.CollectInGameItemCommand;
    import marioslots.controller.commands.ShowWindowCommand;
    import marioslots.controller.commands.StartupCommand;
    import marioslots.controller.commands.SwitchScreenStateCommand;
    import marioslots.controller.commands.SwitchGameStateCommands.AnimationDoneCommand;
    import marioslots.controller.commands.SwitchGameStateCommands.GameEndCommand;
    import marioslots.controller.commands.SwitchGameStateCommands.GameLoseCommand;
    import marioslots.controller.commands.SwitchGameStateCommands.GameStartCommand;
    import marioslots.controller.commands.SwitchGameStateCommands.GameTrackEndCommand;
    import marioslots.controller.commands.SwitchGameStateCommands.GameWinCommand;
    import marioslots.controller.commands.SwitchGameStateCommands.GetSpinCommand;
    import marioslots.controller.signals.CloseWindowSignal;
    import marioslots.controller.signals.CollectInGameItemSignal;
    import marioslots.controller.signals.ShowWindowSignal;
    import marioslots.controller.signals.StartupSignal;
    import marioslots.controller.signals.SwitchScreenStateSignal;
    import marioslots.controller.signals.SwitchGameStateSignals.AnimationDoneSignal;
    import marioslots.controller.signals.SwitchGameStateSignals.GameEndSignal;
    import marioslots.controller.signals.SwitchGameStateSignals.GameLoseSignal;
    import marioslots.controller.signals.SwitchGameStateSignals.GameStartSignal;
    import marioslots.controller.signals.SwitchGameStateSignals.GameTrackEndSignal;
    import marioslots.controller.signals.SwitchGameStateSignals.GameWinSignal;
    import marioslots.controller.signals.SwitchGameStateSignals.GetSpinSignal;
    
    import org.robotlegs.core.ISignalCommandMap;

    public class BootstrapCommands
    {
        public function BootstrapCommands(signalCommandMap:ISignalCommandMap)
        {
			signalCommandMap.mapSignalClass(StartupSignal, 			StartupCommand);
			signalCommandMap.mapSignalClass(SwitchScreenStateSignal,SwitchScreenStateCommand);
			
			signalCommandMap.mapSignalClass(GameStartSignal, 		GameStartCommand);
			signalCommandMap.mapSignalClass(GetSpinSignal, 			GetSpinCommand);
			signalCommandMap.mapSignalClass(AnimationDoneSignal, 	AnimationDoneCommand);
			signalCommandMap.mapSignalClass(GameTrackEndSignal, 	GameTrackEndCommand);
			
			signalCommandMap.mapSignalClass(GameEndSignal, 			GameEndCommand);
			signalCommandMap.mapSignalClass(GameWinSignal, 			GameWinCommand);
			signalCommandMap.mapSignalClass(GameLoseSignal, 		GameLoseCommand);
			
			signalCommandMap.mapSignalClass(ShowWindowSignal, 		ShowWindowCommand);
			signalCommandMap.mapSignalClass(CloseWindowSignal, 		CloseWindowCommand);				
						
			signalCommandMap.mapSignalClass(CollectInGameItemSignal,CollectInGameItemCommand, 	false);
        }
    }
}