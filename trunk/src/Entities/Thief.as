package Entities
{
	import Core.calcs;
	
	import Screens.GameScreen;
	
	import com.cheezeworld.utils.Input;
	import com.cheezeworld.utils.KeyCode;

	public class Thief extends ThiefAsset
	{
		public const SPEED:Number = 0.1;
		public const PICKING_DIST:Number = 60;
		public var _screen:GameScreen;
		public var _loot:int;
		public var _strikes:int = 0;
		
		public function Thief(screen:GameScreen)
		{
			super();
			this.scaleX = 0.3;
			this.scaleY = 0.3;
			_screen = screen;
		}
		
		public function Update(timepassed:int):void
		{
			Move(timepassed);
			if ((Input.instance.isKeyDown(KeyCode.SPACEBAR)) && (_loot == 0))
				pickPocket();
		}
		
		public function pickPocket():void
		{
			for each (var mark:Mark in _screen._marks)
			{
				if (calcs.objDistance(this, mark) < PICKING_DIST)
				{
					_loot = mark._money;
					mark.getRobbed();
					trace("successfully stole " + _loot + " dollars");
					return;
				}
			}
			trace('no mark near');
		}
		public function Move(timepassed:int):void
		{
			var dx:int=0;
			var dy:int=0;
			if(Input.instance.isKeyDown(KeyCode.I))
			{
				dy=-1;
			}
			if(Input.instance.isKeyDown(KeyCode.J))
			{
				dx=-1;
			}
			if(Input.instance.isKeyDown(KeyCode.K))
			{
				dy=1;
			}
			if(Input.instance.isKeyDown(KeyCode.L))
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