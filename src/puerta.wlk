import wollok.game.*
import otros_obj.*
import niveles.*
import resultado.*
import inicio.*
import personaje.*

class Puerta inherits NoColisionable {
	const nivelActual
	method position() = game.at(20, 9)
	method image()= "door.png" 

	method tipo() = "puerta"
	
	method serInteractuadoPor(jugador) {
			
		if (jugador.llavesObtenidas().size() == 3 ) {
			nivelActual.ganaste()			
				}  else {
		game.say(self, "¡Aún te faltan llaves! Seguí buscando.")
		}
	}
}
