package;


import flash.display.DisplayObjectContainer;
import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.display.BlendMode;
import openfl.display.Sprite;
import openfl.Assets;

import Defines;

class OpenflMain extends Sprite {
	
	
	public function new () {
		
		super ();
		
        #if (openfl_legacy) 
        trace("legacy");
        #end

		var layer0 = new Bitmap (Assets.getBitmapData ("assets/images/test/parallax.png"));
		var layer2 = new Bitmap (Assets.getBitmapData ("assets/images/test/layer2multiply.png"));
		var layer3 = new Bitmap (Assets.getBitmapData ("assets/images/test/layer3add.png"));
		
        layer2.blendMode = BlendMode.MULTIPLY;
        layer3.blendMode = BlendMode.ADD;
        
		/*var sprite = new Sprite();
        sprite.blendMode = layer0.blendMode;
        sprite.addChild(layer0);
        addChild(sprite);
        
        sprite = new Sprite();
        sprite.blendMode = layer2.blendMode;
        sprite.addChild(layer2);
        addChild(sprite);
        
        sprite = new Sprite();
        sprite.blendMode = layer3.blendMode;
        sprite.addChild(layer3);
        addChild(sprite);*/
        
        
        addChild(layer0);
        addChild(layer2);
        addChild(layer3);
	}
	
	
}