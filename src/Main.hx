package;

import flash.display.Sprite;
import org.flixel.FlxGame;
import flash.Lib;

/**
 * @author Julian Liebl
 */
class Main extends Sprite 
{
	
	public function new () 
	{
		super();
		
		var demo:FlxGame = new FlxInvaders();
		addChild(demo);
	}
	
	public static function main() {
		
		Lib.current.addChild(new Main());
   
	}
	
}