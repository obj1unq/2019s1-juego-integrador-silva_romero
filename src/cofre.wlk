import wollok.game.*
import otros_obj.*

class Cofre inherits NoColisionable {
	
	const property objeto
	
	method image()= "cofre1.jpg"

		method serInteractuadoPor(jugador) {
			//Si habia un cofre orientado con el jugador, ejecuta esto
			//Por ahora es todo lo que hace. Ya se pone mas complicado cuando pasemos a la Etapa 2
			game.removeVisual(self)
		}

}
