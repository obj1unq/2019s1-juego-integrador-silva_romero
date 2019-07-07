import wollok.game.*
import otros_obj.*
import personaje.*

class Puerta inherits NoColisionable {
	const nivelActual
	method position() = game.at(20, 9)
	method image()= "door.png" 

	method tipo() = "puerta"
	
	method serInteractuadoPor(jugador) {
			
		if (jugador.llavesObtenidas().size() == nivelActual.cantLlavesNecesarias()) {
			nivelActual.ganaste()			
				}  else {
		game.say(self, "¡Aún te faltan llaves! Seguí buscando.")
		}
	}
}
