
import luxe.Color;
import luxe.GameConfig;
import luxe.Input;
import luxe.Sprite;
import luxe.Vector;

class Main extends luxe.Game {

    private static inline var LEVEL_WIDTH = 800;
    private static inline var LEVEL_HEIGHT = 450;
    private static inline var SHIP_VELOCITY:Int = 10;
    private static var WHITE = new Color().rgb(0xffffff);

    private var ship:Sprite;
    private var walls:Array<Sprite>;

    override function config(config:GameConfig) {

        config.window.title = 'Opal Quest';
        config.window.width = LEVEL_WIDTH;
        config.window.height = LEVEL_HEIGHT;
        config.window.fullscreen = false;
        
        return config;

    } //config

    override function ready() {

        ship = new Sprite({ 
            name: 'ship',
            pos: Luxe.screen.mid,
            color: new Color().rgb(0xff0000),
            size: new Vector(32, 32)
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

    } //ready

    override function onkeyup( e:KeyEvent ) {

        if(e.keycode == Key.escape) {
            Luxe.shutdown();
        }

    } //onkeyup

    override function update(dt:Float) {

    } //update
    
    override function onkeydown(event:KeyEvent) {
        if (event.scancode == luxe.Scan.up)
        {
            ship.pos.y -= SHIP_VELOCITY;
        } else if (event.scancode == luxe.Scan.down) {
            ship.pos.y += SHIP_VELOCITY;
        }
        
        if (event.scancode == luxe.Scan.left) {
            ship.pos.x -= SHIP_VELOCITY;
        } else if (event.scancode == luxe.Scan.right) {
            ship.pos.x += SHIP_VELOCITY;
        }
    }

} //Main
