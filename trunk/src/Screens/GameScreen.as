package Screens
{
	import Core.calcs;
	
	import Entities.Mark;
	import Entities.Policeofficer;
	import Entities.Thief;
	
	import com.cheezeworld.entity.GameWorld;
	import com.cheezeworld.screens.AScreen;

	public class GameScreen extends AScreen
	{
		
		
		
		
		public static const TOP_POSITION:int=200;
		public static const BOTTOM_POSITION:int=500;
		public static const LEFT_POSITION:int=0;
		public static const RIGHT_POSITION:int=600;
		
		
		
		public var _marks:Array = new Array();
		public var _thief:Thief;
		public var _policeman:Policeofficer;
		
		public function GameScreen(parent:AScreen)
		{
			AddEntities();
		}
		
		public override function update(timePassed:int):void
		{
			_thief.Update(timePassed);
			_policeman.Update(timePassed);
			for each (var mark:Mark in _marks)
			{
				mark.Update(timePassed);
			}
			//trace(calcs.objDistance(_thief,_policeman));
			
			if (_policeman._rank == 0)
				trace("Policeman has been let go!");
			if (_thief._strikes == 3)
				trace("Thief is going away for life!");
		}
		
		public function AddEntities():void
		{
			
			for(var i:int;i<6;i++)
			{
				var mark:Mark = new Mark();
				mark.y= TOP_POSITION+Math.random()*(BOTTOM_POSITION-TOP_POSITION);
				mark.x= Math.random()*(RIGHT_POSITION);
					
			    _marks.push(mark);
				
				addChild(mark);
			
			}
			
			_thief = new Thief(this);
			_thief.y= TOP_POSITION+Math.random()*(BOTTOM_POSITION-TOP_POSITION);
			_thief.x= Math.random()*(RIGHT_POSITION);
			
			addChild(_thief);
			_policeman = new Policeofficer(this);
			_policeman.y= TOP_POSITION+Math.random()*(BOTTOM_POSITION-TOP_POSITION);
			_policeman.x= Math.random()*(RIGHT_POSITION);
			addChild(_policeman);
			
			
			
		}
			
		
		public override function dispose() : void
		{
			
		}
			
			
		protected var _gameworld:GameWorld;
			
	}
}