package states;
import entities.SortableSpriteGroup;
import flixel.FlxBasic;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.util.FlxSort;
import openfl.errors.Error;

/**
 * ...
 * @author ...
 */
class SortState extends FlxState
{
	private var sortGroup:FlxTypedGroup<SortableSpriteGroup>;
	
	public function new() 
	{
		super();
	}
	
	override public function create():Void 
	{
		super.create();
		
		sortGroup = new FlxTypedGroup<SortableSpriteGroup>();
		add(sortGroup);
	}
	
	public function addSortable(sortable:SortableSpriteGroup, ?z:Int):SortableSpriteGroup{
		if (z != null)
			sortable.z = z;
		
		sortGroup.add(sortable);
		
		return sortable;
	}
	
	public function addSortedSprite(sprite:FlxSprite, z:Int = 0):SortableSpriteGroup{
		return addSortable(new SortableSpriteGroup(sprite.x, sprite.y, z, sprite));
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		
		sortGroup.sort(sortByZ);
	}
	
	private inline function sortByZ(order:Int, obj1:SortableSpriteGroup, obj2:SortableSpriteGroup){
		return FlxSort.byValues(order, obj1.z, obj2.z);
	}
}