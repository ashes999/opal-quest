package classes;

import luxe.collision.shapes.Polygon;
import luxe.Input;
import luxe.Sprite;
import luxe.Vector;

class Ship extends luxe.Sprite
{
    private static inline var SHIP_VELOCITY:Int = 100;
    
    private var velocity:Vector;
    
    public function new(config)
    {
        super(config);
        velocity = new Vector(0, 0);
    }
    
    public function getPolygon():Polygon
    {
        return Polygon.rectangle(this.pos.x, this.pos.y, this.size.x, this.size.y);
    }
    
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
    
    override public function update(dt:Float):Void
    {
        super.update(dt);
        var moveX = this.velocity.x * dt;
        var moveY = this.velocity.y * dt;
        this.pos.x += moveX;
        this.pos.y += moveY;
    }
}