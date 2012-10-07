package kha;

import kha.Game;
import kha.Key;
import kha.Loader;

class Starter {
	static var game: Game;
	static var painter: kha.cpp.Painter;
	
	public function new() {
		Loader.init(new kha.cpp.Loader());
	}
	
	public function start(game: Game) {
		Starter.game = game;
		Configuration.setScreen(new EmptyScreen(game.getWidth(), game.getHeight(), new Color(0, 0, 0)));
		Loader.the().loadProject(loadFinished);
	}
	
	public static function loadFinished() {
		if (Loader.getInstance().getWidth() > 0 && Loader.getInstance().getHeight() > 0) {
			game.setWidth(Loader.getInstance().getWidth());
			game.setHeight(Loader.getInstance().getHeight());
		}
		Loader.the().initProject();
		Configuration.setScreen(game);
		Configuration.screen().setInstance();
		game.loadFinished();
		painter = new kha.cpp.Painter();
	}

	public static function frame() {
		game.update();
		painter.begin();
		game.render(painter);
		painter.end();
	}
	
	public static function pushUp(): Void {
		game.buttonDown(Button.UP);
	}
	
	public static function pushDown(): Void {
		game.buttonDown(Button.DOWN);
	}

	public static function pushLeft(): Void {
		game.buttonDown(Button.LEFT);
	}

	public static function pushRight(): Void {
		game.buttonDown(Button.RIGHT);
	}
	
	public static function pushButton1(): Void {
		game.buttonDown(Button.BUTTON_1);
	}

	public static function releaseUp(): Void {
		game.buttonUp(Button.UP);
	}

	public static function releaseDown(): Void {
		game.buttonUp(Button.DOWN);
	}

	public static function releaseLeft(): Void {
		game.buttonUp(Button.LEFT);
	}
	
	public static function releaseRight(): Void {
		game.buttonUp(Button.RIGHT);
	}
	
	public static function releaseButton1(): Void {
		game.buttonUp(Button.BUTTON_1);
	}
	
	public static function mouseDown(x: Int, y: Int) : Void {
		game.mouseDown(x, y);
	}

	public static function mouseUp(x: Int, y: Int) : Void {
		game.mouseUp(x, y);
	}
	
	public static function mouseMove(x: Int, y: Int): Void {
		game.mouseMove(x, y);
	}
}