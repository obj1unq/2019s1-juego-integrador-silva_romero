import wollok.game.*
import personaje.*
import niveles.*

object inicio{
	
	method portada(){
	game.clear()
	game.title("smash bros")
	game.width(14)
	game.height(22)
	game.ground("Celda.png")
	game.addVisual(inicioDelJuego)
	keyboard.s().onPressDo{nivel1.start()}
}	
	}
	
object inicioDelJuego {
	var imagen = "gameOver.png"
	var property position = game.at(1,1)

}
//