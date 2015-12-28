package
{
	import com.cheezeworld.screens.Root;
	import com.cheezeworld.utils.Input;
	
	import flash.display.Sprite;
	
	[SWF(height="500",width="600")]
	public class FakeOut extends Sprite
	{
		
		private var app:Root;
		
		public function FakeOut()
		{
			app = new Heist(this.stage);
			Input.instance.activate(this.stage);
			addChild(app);
		}
	}
}