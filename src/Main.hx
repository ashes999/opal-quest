
import luxe.Color;
import luxe.GameConfig;
import luxe.Input;
import luxe.collision.shapes.Polygon;
import luxe.Sprite;
import luxe.Vector;

import classes.ExtendedSprite;
import classes.Ship;

class Main extends luxe.Game
{

    private static inline var LEVEL_WIDTH = 800;
    private static inline var LEVEL_HEIGHT = 450;
    private static var WHITE = new Color().rgb(0xffffff);

    private var ship:Ship;
    private var walls:Array<ExtendedSprite>;
    private var bullets = new Array<ExtendedSprite>();

    override function config(config:GameConfig) {

        config.window.title = 'Opal Quest';
        config.window.width = LEVEL_WIDTH;
        config.window.height = LEVEL_HEIGHT;
        config.window.fullscreen = false;
        
        return config;

    } //config

    override function ready() {

        ship = new Ship({ 
            name: 'ship',
            pos: Luxe.screen.mid,
            color: new Color().rgb(0xff0000),
            size: new Vector(32, 32),
        });
        
        walls = new Array<ExtendedSprite>();
        
        walls.push(new ExtendedSprite({
           name: "top wall",
           pos: new Vector(LEVEL_WIDTH / 2, 0),
           color: WHITE,
           size: new Vector(LEVEL_WIDTH, 1) 
        }));
        
        walls.push(new ExtendedSprite({
           name: "bottom wall",
           pos: new Vector(LEVEL_WIDTH / 2, LEVEL_HEIGHT - 1),
           color: WHITE,
           size: new Vector(LEVEL_WIDTH, 1) 
        }));
        
        walls.push(new ExtendedSprite({
           name: "left wall",
           pos: new Vector(1, LEVEL_HEIGHT / 2),
           color: WHITE,
           size: new Vector(1, LEVEL_HEIGHT) 
        }));
        
        walls.push(new ExtendedSprite({
           name: "right wall",
           pos: new Vector(LEVEL_WIDTH, LEVEL_HEIGHT / 2),
           color: WHITE,
           size: new Vector(1, LEVEL_HEIGHT) 
        }));
    } //ready

    override function onkeyup( e:KeyEvent ) {

        if(e.keycode == Key.escape) {
            Luxe.shutdown();
        }
        
        ship.onKeyUp(e);

    } //onkeyup

    override function update(dt:Float)
    {        
        ship.update(dt);        
        var shipPolygon = ship.getPolygon();
        for (wall in walls) {
            var wallPolygon = wall.getPolygon();
            var result = shipPolygon.testPolygon(wallPolygon);
            if (result != null)
            {
                // Move player away from the wall
                ship.pos.x += result.separation.x;
                ship.pos.y += result.separation.y;
            }
        }
    } //update
    
    override function onkeydown(event:KeyEvent)
    {
        ship.onKeyDown(event);
    }

    override function onmouseup(event:luxe.MouseEvent)
    {
        // The farther you click from the ship, the faster the bullet
        var vX = event.pos.x - ship.pos.x;
        var vY = event.pos.y - ship.pos.y;
        
        var bullet = new ExtendedSprite({
            pos: new Vector(ship.pos.x, ship.pos.y),
            color: new Color().rgb(0xffff00),
            size: new Vector(4, 4)
        });
        
        bullet.velocity = new Vector(vX, vY);
    }

} //Main
