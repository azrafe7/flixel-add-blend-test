package entities;
import flixel.FlxSprite;
import flixel.group.FlxGroup;
import flixel.group.FlxSpriteGroup;

/**
 * ...
 * @author Miguel M.
 */
class SortableSpriteGroup extends FlxSpriteGroup
{
	public var z:Int = 0;
	
	public function new(x:Float = 0, y:Float = 0, z:Int = 0, ?baseSprite:FlxSprite) 
	{
		super();
		
		this.x = x;
		this.y = y;
		this.z = z;
		
		if (baseSprite != null)
			add(baseSprite);
	}
	
}