import wollok.game.*
import otros_obj.*

class Cofre inherits NoColisionable {
	
	const property position
	var property contenido

	method tipo() = "cofre"
	
	method image()= "cofre1.png"

	method serInteractuadoPor(jugador) {
		self.mostrarContenido()
		game.removeVisual(self)
	}
	
	method mostrarContenido() {	
			game.addVisualIn(contenido,self.position())
			
			if (contenido.tipo() == "bomba") {
				game.say(contenido,"CUIDADO!!!")
				contenido.explotar()
			}
	}
		
}
