import wollok.game.*
object resultado {
	var position = game.at(0,0)
	var property perdio = false
	var property image
	 // pierde pero no deja sacar la imagen
	 method perdiste()
	 		{game.clear()
			image ="gameOver.jpg"
			perdio = true
			game.addVisual(self)}
		method ganaste(){
		game.clear()
		image= "ganaste.jpg"
		game.addVisual(self)
	}
}

object gameOver {
	method image() ="gameOver.jpg"
}