package Core
{
	import flash.display.DisplayObject;

	public class calcs
	{
		public static function objDistance(obj1:DisplayObject, obj2:DisplayObject):Number
		{
			return Math.sqrt(Math.pow((obj1.x - obj2.x),2) + Math.pow((obj1.y - obj2.y),2));
		}
	}
}