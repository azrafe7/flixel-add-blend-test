package;


import flash.display.DisplayObjectContainer;
import flash.display.Graphics;
import flash.events.Event;
import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.display.BlendMode;
import openfl.display.Sprite;
import openfl.Assets;

#if (tilesheet)
import openfl._legacy.display.Tilesheet;
#end

import Defines;

class OpenflMain extends Sprite {
    
    var layer0:openfl.display.Bitmap;
    var layer2:openfl.display.Bitmap;
    var layer3:openfl.display.Bitmap;
	
	
	public function new () {
		
		super ();
		
        #if (openfl_legacy) 
        trace("legacy");
        #end
        #if (tilesheet)
        trace("tilesheet");
        #end

		layer0 = new Bitmap (Assets.getBitmapData ("assets/images/test/parallax.png"));
		layer2 = new Bitmap (Assets.getBitmapData ("assets/images/test/layer2multiply.png"));
		//layer2 = new Bitmap (Assets.getBitmapData ("assets/images/test/layer2multiply-pre.png"));
		layer3 = new Bitmap (Assets.getBitmapData ("assets/images/test/layer3add.png"));
		
        trace("layer0 transparent: " + layer0.bitmapData.transparent);
        trace("layer2 transparent: " + layer2.bitmapData.transparent);
        trace("layer3 transparent: " + layer3.bitmapData.transparent);
        
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
        
        #if (!tilesheet)
        
        addChild(layer0);
        addChild(layer2);
        addChild(layer3);
        
        #else
        
        layer2.bitmapData.premultipliedAlpha = true;
        
        stage.addEventListener(Event.ENTER_FRAME, onEnter);
        
        #end
	}
	
	public function onEnter(_):Void {
        #if (tilesheet)
        
        var g:Graphics = this.graphics;
        g.clear();
        
        /*g.beginFill(0xffffff, 1);
        g.drawRect(0, 0, stage.stageWidth, stage.stageHeight);
        g.endFill();*/
        
        //         [x, y, id, alpha]
        var data = [0., 0, 0];
        
        var sheet0 = new Tilesheet(layer0.bitmapData);
        var id0 = sheet0.addTileRect(layer0.bitmapData.rect);
        data[2] = id0;
        sheet0.drawTiles(g, data, false, Tilesheet.TILE_BLEND_NORMAL);
        //g.drawTiles(sheet0, data, true, Tilesheet.TILE_BLEND_NORMAL);
        
        var sheet2 = new Tilesheet(layer2.bitmapData);
        var id2 = sheet2.addTileRect(layer2.bitmapData.rect);
        data = data.concat([]);
        data[2] = id2;
        sheet2.drawTiles(g, data, false, Tilesheet.TILE_BLEND_MULTIPLY);
        //g.drawTiles(sheet2, data, true, Tilesheet.TILE_BLEND_MULTIPLY);
        
        var sheet3 = new Tilesheet(layer3.bitmapData);
        var id3 = sheet3.addTileRect(layer3.bitmapData.rect);
        data = data.concat([]);
        data[2] = id3;
        sheet3.drawTiles(g, data, false, Tilesheet.TILE_BLEND_ADD);
        //g.drawTiles(sheet3, data, true, Tilesheet.TILE_BLEND_ADD);
        
        #end
    }
}