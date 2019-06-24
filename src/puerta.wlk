import wollok.game.*
import otros_obj.*
import niveles.*

class Puerta inherits NoColisionable {
	const nivelActual

	method image()= "door.png" 

	method tipo() = "puerta"
	
	method serInteractuadoPor(jugador) {
			
		if (jugador.llavesObtenidas().size() == 3 && nivelActual.tipo() == 3) {
			game.say(self, "Ganaste el juego!!")   
		}  else if (jugador.llavesObtenidas().size() == 3 && nivelActual.tipo() != 3) {
			game.say(self, "Pasaste de nivel!!")   
			nivelActual.ganaste()
		}  else {
		game.say(self, "¡Aún te faltan llaves! Seguí buscando.")
		}
	}
}
