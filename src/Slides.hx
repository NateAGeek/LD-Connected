package ;
import com.haxepunk.Entity;
import com.haxepunk.graphics.Image;
import com.haxepunk.graphics.Graphiclist;
import com.haxepunk.Graphic;
import com.haxepunk.graphics.Text;
import com.haxepunk.HXP;
import com.haxepunk.Tween;
import com.haxepunk.tweens.misc.ColorTween;
import com.haxepunk.utils.Ease;


/**
 * ...
 * @author NateAGeek
 */
class Slides extends Entity {
	
	var currentPos:Int = 0;
	var colorTween:ColorTween;
	var introText:Text;
	var introTexts:Array<String>;
	var completed:Bool;
	
	public function new(texts:Array<String>) {
		super(0, 0);
		var background:Graphic = Image.createRect(HXP.windowWidth, HXP.windowHeight, 0x000000);
		
		introTexts = texts;
		
		introText = new Text(introTexts[currentPos], 180, 160, 320, 360, {align: CENTER});
		
		var fullScene:Graphiclist = new Graphiclist([background, introText]);
		
		colorTween = new ColorTween(fadeIn, TweenType.OneShot);
		
		colorTween.tween(5, 0xFFFFFF, 0x000000, 1.0, 0.0);
		addTween(colorTween, true);	
		completed = false;
		
		graphic = fullScene;
	}
	
	public function fadeOut(e:Dynamic = null) {
		colorTween = new ColorTween(fadeIn, TweenType.OneShot);
		colorTween.tween(5, 0xFFFFFF, 0x000000, 1.0, 0.0);
		addTween(colorTween, true);	
	}
	
	public function fadeIn(e:Dynamic = null) {
		colorTween = new ColorTween(fadeOut, TweenType.OneShot);
		colorTween.tween(2, 0x000000, 0xFFFFFF, 1.0, 0.0);
		addTween(colorTween, true);
		currentPos++;
		if(currentPos >= introTexts.length){
			completed = true;
		}else {
			introText.text = introTexts[currentPos];
		}
	}
	
	public override function update() {
		super.update();
		introText.color = colorTween.color;
	}
	
	public function isCompleted() {
		return completed;
	}
	
}