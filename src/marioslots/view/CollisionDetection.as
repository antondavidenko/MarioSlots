package marioslots.view
{
	import flash.geom.Rectangle;
	
	import org.osflash.signals.Signal;
	import org.robotlegs.mvcs.Actor;

	public class CollisionDetection extends Actor
	{
		public var _coinCollisionSignal:Signal = new Signal();
		public var _enemyWinCollisionSignal:Signal = new Signal();
		public var _enemyLoseCollisionSignal:Signal = new Signal();
		
		public function detectCoinColission($hero:Rectangle, $coinsList:Array):void
		{
			var i:int = 0;
			
			for (i=0; i < $coinsList.length; i++)
			{
				if ($hero.intersects($coinsList[i])) 
				{
					_coinCollisionSignal.dispatch(i);
				}
			}			
		}
		
		public function detectEnemyColission($hero:Rectangle, $enemysList:Array, $inAir:Boolean):void
		{
			var i:int = 0;
			
			for (i=0; i < $enemysList.length; i++)
			{
				if ($hero.intersects($enemysList[i])) 
				{
					if ($inAir)
					{
						_enemyLoseCollisionSignal.dispatch(i);
					}
					else
					{
						_enemyWinCollisionSignal.dispatch(i);
					}
				}
			}			
		}
	}
}