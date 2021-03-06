import org.flixel.FlxGroup;
import org.flixel.FlxSprite;
import org.flixel.FlxG;
import openfl.Assets;


class Alien extends FlxSprite {

	var shotClock : Float;
	var originalX : Int;
	public function new(X : Int, Y : Int, Color : UInt, Bullets : FlxGroup) {
		super(X, Y);
		//Initialize sprite object
		//The graphic of the squid monster
		loadGraphic("assets/alien.png", true);
		//Load this animated graphic file
		color = Color;
		//setting the color tints the plain white alien graphic
		originalX = X;
		resetShotClock();
		//Time to create a simple animation!  alien.png has 3 frames of animation in it.
		//We want to play them in the order 1, 2, 3, 1 (but of course this stuff is 0-index).
		//To avoid a weird, annoying appearance the framerate is randomized a little bit
		// to a value between 6 and 10 (6+4) frames per second.
		addAnimation("Default", [0, 1, 2, 0], Std.int(6 + FlxG.random() * 4), true);
		//Now that the animation is set up, it's very easy to play it back!
		play("Default", true);
		//Everybody move to the right!
		velocity.x = 10;
	}

	//Basic game loop is BACK y'all
	override public function update() : Void {
		super.update();
		//If alien has moved too far to the left, reverse direction and increase speed!
		if(x < originalX - 8)  {
			x = originalX - 8;
			velocity.x = -velocity.x;
			velocity.y++;
		}
		if(x > originalX + 8) //If alien has moved too far to the right, reverse direction
		{
			x = originalX + 8;
			velocity.x = -velocity.x;
		}

		//Then do some bullet shooting logic
		if(y > FlxG.height * 0.35) shotClock -= FlxG.elapsed;
		if(shotClock <= 0)  {
			//We counted down to zero, so it's time to shoot a bullet!
			resetShotClock();
			var playState:PlayState = cast(FlxG.state, PlayState);
			if(playState != null){
				var bullet : FlxSprite = cast(playState.alienBullets.recycle(), FlxSprite);
				bullet.reset(x + width / 2 - bullet.width / 2, y);
				bullet.velocity.y = 65;
			}
		}
	}

	//This function just resets our bullet logic timer to a random value between 1 and 11
	function resetShotClock() : Void {
		shotClock = 1 + FlxG.random() * 10;
	}

}

