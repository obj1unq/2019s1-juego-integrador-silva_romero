import wollok.game.*
object resultado {
	const position = game.at(0,0)
	var property perdio = false
	var image
	 method perdiste(){game.clear()
			
			image = "gameOver.jpg"
			perdio = true
			game.addVisual(self)}
	method ganaste(){
		game.clear()
		image= "ganaste.jpg"
		game.addVisual(self)
	}
}