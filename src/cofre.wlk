import wollok.game.*
import otros_obj.*

class Cofre inherits NoColisionable {
	
	const property objeto
	const armas = []
	const posiones = []
	const venenos = []
	
	method image()= "cofre1.jpg"

	
	method serInteractuadoPor(jugador) {
		self.mostrarContenido()
		game.removeVisual(self)
	}
	
	
	method mostrarContenido() {
			game.addVisual(armas.get(0.randomUpTo(armas.size()-1)))
	}
		
}
