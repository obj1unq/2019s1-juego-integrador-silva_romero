import wollok.game.*
import personaje.*
import niveles.*

object inicio{
	
	method portada() {
		game.title("smash bros")
		game.width(14)
		game.height(22)
		game.ground("Celda.png")
		game.addVisual(inicioDelJuego)
		keyboard.s().onPressDo{ game.clear()
		nivel1.start()
		}
	}

}
	
object inicioDelJuego {
	var image = "gameOver.png"
	var property position = game.at(1,1)

}