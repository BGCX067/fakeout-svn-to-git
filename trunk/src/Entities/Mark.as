package Entities
{
	
	import Screens.GameScreen;
	
	import flash.events.TimerEvent;
	import flash.utils.Timer;

	public class Mark extends BrokerAsset
	{
		
		public function Mark()
		{
			super();
			
			 
			this.scaleX = 0.17;
			this.scaleY = 0.17;
			_money = Math.round(Math.random()*4);
			_money = 20 + 20*_money;
		}

		public const SPEED:Number = 0.05;
		public var dx:Number;
		public var dy:Number;
		public var _money:int;
		public var _noticeTimer:Timer;
		
		public function getRobbed():void
		{
			_money = 0;
			var noticeDelay:Number = Math.random()*6000 + 2000;
			_noticeTimer = new Timer(noticeDelay, 1);
			_noticeTimer.addEventListener(TimerEvent.TIMER, noticeRobbed);
			_noticeTimer.start();
		}
		
		public function noticeRobbed(event:TimerEvent):void
		{
			trace("Oh no, I've been robbed!!! Help!!!");
		}
		public function randomDir():void
		{
			dx = Math.random()*1.4 - 0.4;
			if (dx < 0.3) {
				dx = dx - 0.6;
				this.scaleX = 0.17;
			} else {
				this.scaleX = -0.17;
			}
			dy = Math.random()*1.4 - 0.4;
			if (dy < 0.3)
				dy = dy - 0.6;
		}
		
		public function Update(timePassed:int):void
		{
			move(timePassed);
		}
		
		public function move(timepassed:int):void
		{
			x=x+dx*SPEED*timepassed;
			y=y+dy*SPEED*timepassed;
			
			if(x<GameScreen.LEFT_POSITION)
			{
				x=GameScreen.LEFT_POSITION;
				randomDir();
			}
			if(x>GameScreen.RIGHT_POSITION)
			{
				x=GameScreen.RIGHT_POSITION;
				randomDir();
			}
			if(y<GameScreen.TOP_POSITION)
			{
				y=GameScreen.TOP_POSITION;
				randomDir();
			}
			if(y>GameScreen.BOTTOM_POSITION)
			{
				y = GameScreen.BOTTOM_POSITION;
				randomDir();
			}
		}
	}
}