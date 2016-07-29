package classes;

import luxe.collision.shapes.Polygon;
import luxe.Input;
import luxe.Sprite;
import luxe.Vector;

import classes.ExtendedSprite;

class Ship extends ExtendedSprite
{
    private static inline var SHIP_VELOCITY:Int = 100;
        
    public function onKeyDown(event:KeyEvent):Void
    {
        if (event.scancode == luxe.Scan.up)
        {
            this.velocity.y = -SHIP_VELOCITY;
        }
        else if (event.scancode == luxe.Scan.down)
        {
            this.velocity.y = SHIP_VELOCITY;
        }
        
        if (event.scancode == luxe.Scan.left)
        {
            this.velocity.x = -SHIP_VELOCITY;
        }
        else if (event.scancode == luxe.Scan.right)
        {
            this.velocity.x = SHIP_VELOCITY;
        }
    }
    
    public function onKeyUp(event:KeyEvent):Void
    {
        if (event.scancode == luxe.Scan.up || event.scancode == luxe.Scan.down)
        {
            this.velocity.y = 0;
        }
        
        if (event.scancode == luxe.Scan.left || event.scancode == luxe.Scan.right)
        {
            this.velocity.x = 0;
        }
    }
}