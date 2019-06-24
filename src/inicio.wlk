import wollok.game.*
import personaje.*
import niveles.*

object inicio {

	method portada() {
		game.title("Escape : the pikachu's dungeon")
		game.height(14)
		game.width(22)
		game.ground("concreto.png")
		game.addVisual(inicioDelJuego)
		keyboard.s().onPressDo{ game.clear()
			nivel1.cargar()
		}
	}

}

object inicioDelJuego {

	var property position = game.origin()

	method image() = "gameOver.jpg"

}

