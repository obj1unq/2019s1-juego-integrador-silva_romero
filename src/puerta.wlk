import wollok.game.*
import otros_obj.*

object puerta inherits NoColisionable {
	
	method image()= "door.png" // imagen provisoria, que no nos caiga el fbi!
	
	method serInteractuadoPor(jugador) {
		//Si tiene 3 llaves, la abre y gana el juego. Si no, le dice "Faltan llaves."
		game.say(self, "si ves esto es porque hay algo bien! :D falta implementar mecanismos.")
	}
}
