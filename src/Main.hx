package ;

import com.haxepunk.RenderMode;
import com.haxepunk.Engine;
import com.haxepunk.HXP;

/**
 * ...
 * @author NateAGeek
 */

class Main extends Engine
{

	public static inline var ScreenWidth:Int = 640;
	public static inline var ScreenHeight:Int = 360;
	public static inline var FrameRate:Int = 60;
	public static inline var ClearColor:Int = 0x000000;
	public static inline var ProjectName:String = "Timothy";

	function new()
	{
		super(ScreenWidth, ScreenHeight, FrameRate, false, RenderMode.BUFFER);
	}

	override public function init()
	{
		HXP.console.enable();
		HXP.screen.color = ClearColor;
		HXP.screen.scale = 1;
		HXP.scene = new Game();
	}

	public static function main()
	{
		var app = new Main();
	}
}
