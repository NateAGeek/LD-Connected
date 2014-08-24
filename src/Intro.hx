package ;

import com.haxepunk.Scene;
import com.haxepunk.HXP;
import lime.helpers.Gamepad;
/**
 * ...
 * @author NateAGeek
 */
class Intro extends Scene
{

	var intro:Slides;
	
	public function new() {
		super();
		
	}
	
	public override function begin() {
		super.begin();
		
		intro = new Slides(["Everyone has a fear", "The connection between life and a death", "This is the story of a boy", "Timothy"]);
		add(intro);
		
	}
	
	public override function update() {
		super.update();
		
		if (intro.isCompleted()) {
			super.end();
			HXP.scene = new Game();
		}
		
	}
	
}