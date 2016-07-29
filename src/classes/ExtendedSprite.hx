package classes;

import luxe.collision.shapes.Polygon;
import luxe.Input;
import luxe.Sprite;
import luxe.Vector;

class ExtendedSprite extends luxe.Sprite
{
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
    
    override public function update(dt:Float):Void
    {
        super.update(dt);
        var moveX = this.velocity.x * dt;
        var moveY = this.velocity.y * dt;
        this.pos.x += moveX;
        this.pos.y += moveY;
    }
}