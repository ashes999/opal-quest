
import luxe.Color;
import luxe.GameConfig;
import luxe.Input;
import luxe.collision.shapes.Polygon;
import luxe.Sprite;
import luxe.Vector;

import classes.Ship;

class Main extends luxe.Game
{

    private static inline var LEVEL_WIDTH = 800;
    private static inline var LEVEL_HEIGHT = 450;
    private static var WHITE = new Color().rgb(0xffffff);

    private var ship:Ship;
    private var walls:Array<Sprite>;
    private var wallPolygons:Array<Polygon> = new Array<Polygon>();

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
        
        walls = new Array<Sprite>();
        
        walls.push(new Sprite({
           name: "top wall",
           pos: new Vector(LEVEL_WIDTH / 2, 0),
           color: WHITE,
           size: new Vector(LEVEL_WIDTH, 1) 
        }));
        
        walls.push(new Sprite({
           name: "bottom wall",
           pos: new Vector(LEVEL_WIDTH / 2, LEVEL_HEIGHT - 1),
           color: WHITE,
           size: new Vector(LEVEL_WIDTH, 1) 
        }));
        
        walls.push(new Sprite({
           name: "left wall",
           pos: new Vector(1, LEVEL_HEIGHT / 2),
           color: WHITE,
           size: new Vector(1, LEVEL_HEIGHT) 
        }));
        
        walls.push(new Sprite({
           name: "right wall",
           pos: new Vector(LEVEL_WIDTH, LEVEL_HEIGHT / 2),
           color: WHITE,
           size: new Vector(1, LEVEL_HEIGHT) 
        }));
        
        for (wall in walls) {
            var r = Polygon.rectangle(wall.pos.x, wall.pos.y, wall.size.x, wall.size.y);
            wallPolygons.push(r);
        }

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
        for (wall in wallPolygons) {
            var result = shipPolygon.testPolygon(wall);
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

} //Main
