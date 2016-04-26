package;

import flixel.FlxGame;
import openfl.display.Sprite;
import states.MainState;

class Main extends Sprite
{
	public static inline var GAME_WIDTH:Int = 1024;
	public static inline var GAME_HEIGHT:Int = 576;
	
	public function new()
	{
    #if (openfl_legacy)
        trace("legacy");
    #end
    
		super();
		addChild(new FlxGame(GAME_WIDTH, GAME_HEIGHT, MainState, 1, 60, 60, true, false));
	}
}