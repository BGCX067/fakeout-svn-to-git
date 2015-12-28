package
{
	import Screens.GameScreen;
	
	import com.cheezeworld.screens.*;
	
	import flash.display.*;

	public class Heist extends Root
	{
		private static var _screens:Array;
		private static var m_currentScreen:int;
		
	
			public function Heist(stage:Stage)
			{			
				super(stage);
				
				_screens = [];
				_screens.push( GameScreen );
				
				setScreen( _screens[ 0 ] );	
			}
	}
}