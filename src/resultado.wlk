import wollok.game.*
import otros_obj.*
import personaje.*
import inicio.*
import reloj.*
object resultado {
	var position = game.at(0,0)
	var image= "gameOver.jpg"
	 // pierde pero no deja sacar la imagen
	 
	method ganaste(){
			game.clear()
			image= "ganaste.jpg"
			game.addVisual(self)
	}
	
}

