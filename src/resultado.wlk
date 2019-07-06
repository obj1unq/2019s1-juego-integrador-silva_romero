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
	method perdiste(){
		game.onTick(1500,"self",{
			game.clear()
			game.addVisual(self)
			control.reiniciar()
		})
			
	}
}

object control {
	
	method reiniciar() { 
			
			keyboard.r().onPressDo {
			game.clear()
			self.reinicioDeObjectos()
			inicio.portada()
									}
						}
	method reinicioDeObjectos(){
		personaje.restart()
		reloj.reiniciar()
	}
}