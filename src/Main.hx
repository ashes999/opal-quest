
import luxe.Color;
import luxe.GameConfig;
import luxe.Input;
import luxe.Sprite;
import luxe.Vector;

class Main extends luxe.Game {

    var ship:Sprite;
    private static inline var SHIP_VELOCITY:Int = 10;

    override function config(config:GameConfig) {

        config.window.title = 'luxe game';
        config.window.width = 800;
        config.window.height = 450;
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
