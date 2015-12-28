package Entities
{

	import Core.calcs;
	
	import Screens.GameScreen;
	
	import com.cheezeworld.utils.Input;
	import com.cheezeworld.utils.KeyCode;
	
	public class Policeofficer extends PoliceManAsset
	{
		public const SPEED:Number = 0.1;
		public const ARREST_DIST:int = 60;
		public var _screen:GameScreen;
		public var _rank:int = 3;
		
		public function Policeofficer(screen:GameScreen)
		{
			super();
			this.scaleX = 0.19;
			this.scaleY = 0.19;
			_screen = screen;
		}
		
		public function Update(timepassed:int):void
		{
			Move(timepassed);
			if (Input.instance.isKeyPressed(KeyCode.Q))
				arrest();
		}
		
		public function arrest():void
		{
			if (calcs.objDistance(this, _screen._thief) < ARREST_DIST)
			{
				if (_screen._thief._loot > 0)
				{
					_rank += 1;
					_screen._thief._strikes += 1;  
					trace("Nabbed the crook!");
					trace("new ranks is "+_rank);
					trace("This is strike number " + _screen._thief._strikes); 
					_screen._thief._loot = 0;
				} else {
					_rank -= 1;
 					trace("police brutality! new rank is "+_rank);
				}
			}
		}
		
		public function Move(timepassed:int):void
		{
			var dx:int=0;
			var dy:int=0;
			if(Input.instance.isKeyDown(KeyCode.W))
			{
				dy=-1;
			}
			if(Input.instance.isKeyDown(KeyCode.A))
			{
				dx=-1;
			}
			if(Input.instance.isKeyDown(KeyCode.S))
			{
				dy=1;
			}
			if(Input.instance.isKeyDown(KeyCode.D))
			{
				dx=1;
			}
			if ((dx == 0) && (dy == 0))
			{
				this.stop();
			} else {
				this.play();
				if (dx > 0)
					this.scaleX = -0.3;
				else
					this.scaleX = 0.3;
			}
			
			x=x+dx*SPEED*timepassed;
			y=y+dy*SPEED*timepassed;
			
			if(x<GameScreen.LEFT_POSITION)
				x=GameScreen.LEFT_POSITION;
			if(x>GameScreen.RIGHT_POSITION)
				x=GameScreen.RIGHT_POSITION;
			if(y<GameScreen.TOP_POSITION)
				y=GameScreen.TOP_POSITION;
			if(y>GameScreen.BOTTOM_POSITION)
				y = GameScreen.BOTTOM_POSITION;
			
			
		}
	}
}