import wollok.game.*
import personaje.*
import niveles.*

object inicio {

	method portada() {
		game.title("smash bros")
		game.height(14)
		game.width(22)

		game.ground("celda.png")
		game.addVisual(inicioDelJuego)
		keyboard.s().onPressDo{ 
			game.clear()
			nivel1.start()
		}
		
	}

}

object inicioDelJuego {

	var property position = game.origin()

	method image() = "gameOver.jpg"

}

