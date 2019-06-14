import wollok.game.*
import otros_obj.*

class Cofre inherits NoColisionable {
	
	const property position
	var property contenido
	
	method image()= "cofre1.jpg"

	method serInteractuadoPor(jugador) {
		self.mostrarContenido()
		game.removeVisual(self)
	}
	
	method mostrarContenido() {
			game.addVisualIn(contenido,self.position())
	}
		
}
