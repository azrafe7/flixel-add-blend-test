package states;
import entities.SortableSpriteGroup;
import flixel.FlxCamera.FlxCameraFollowStyle;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import openfl.display.BlendMode;

/**
 * ...
 * @author Miguel M.
 */
class MainState extends SortState
{
	public function new()
	{
		super();
	}
	
	override public function create():Void 
	{
		super.create();
		
		FlxG.camera.bgColor = FlxColor.WHITE;
		
		addSortedSprite(new FlxSprite(0, 0, "assets/images/test/layer1.png"), 1).scrollFactor.set(0.8, 0.8);
		
		var layer2:FlxSprite = new FlxSprite(0, 0, "assets/images/test/layer2multiply.png");
		layer2.blend = BlendMode.MULTIPLY;
		addSortedSprite(layer2, 2);
		
		var layer3:FlxSprite = new FlxSprite(0, 0, "assets/images/test/layer3add.png");
		layer3.blend = BlendMode.ADD;
		addSortedSprite(layer3, 3);
		
		addSortedSprite(new FlxSprite(0, 0, "assets/images/test/parallax.png"), -1);
	}
}