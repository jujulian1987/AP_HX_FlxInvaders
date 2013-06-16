import org.flixel.FlxGame;
import org.flixel.FlxG;
import flash.Lib;


class FlxInvaders extends FlxGame {

	public function new() {		
		var stageWidth:Int = Lib.current.stage.stageWidth;
		var stageHeight:Int = Lib.current.stage.stageHeight;
		var ratioX:Float = stageWidth / 320;
		var ratioY:Float = stageHeight / 240;
		var ratio:Float = Math.min(ratioX, ratioY);
		super(Math.ceil(stageWidth / ratio), Math.ceil(stageHeight / ratio), PlayState, ratio, 30, 30);
	}

}

