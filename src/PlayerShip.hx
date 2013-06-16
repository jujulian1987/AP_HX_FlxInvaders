import org.flixel.FlxSprite;
import org.flixel.FlxG;

class PlayerShip extends FlxSprite {
	//Graphic of the player's ship
	//Constructor for the player - just initializing a simple sprite using a graphic.
	public function new() {
		//This initializes this sprite object with the graphic of the ship and
		// positions it in the middle of the screen.
		super(FlxG.width / 2 - 6, FlxG.height - 12, "assets/ship.png");
	}

	//Basic game loop function again!
	override public function update() : Void {
		//Controls!
		velocity.x = 0;
		//Default velocity to zero
		if(FlxG.keys.LEFT) velocity.x -= 150;
		if(FlxG.keys.RIGHT) velocity.x += 150;
		super.update();
		//Here we are stopping the player from moving off the screen,
		// with a little border or margin of 4 pixels.
		if(x > FlxG.width - width - 4) x = FlxG.width - width - 4;
		if(x < 4) x = 4;
		if(FlxG.keys.justPressed("SPACE"))  {
			//Space bar was pressed!  FIRE A BULLET
			var playState:PlayState = cast(FlxG.state, PlayState);
			if (playState != null) {
				if(playState.playerBullets != null){
					var bullet : FlxSprite = cast(playState.playerBullets.recycle(), FlxSprite);
					if(bullet != null){
						bullet.reset(x + width / 2 - bullet.width / 2, y);
						bullet.velocity.y = -140;
					}
				}
			}
		}
	}

}

