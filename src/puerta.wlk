import wollok.game.*
import otros_obj.*

object puerta inherits NoColisionable {
	
	method image()= "door.png" // imagen provisoria, que no nos caiga el fbi!
	
	method serInteractuadoPor(jugador) {
		//Si tiene 3 llaves, la abre y gana el juego. Si no, le dice "Faltan llaves."
		if (jugador.llavesObtenidas() == 3){
			game.say(self, "Ganaste!!")        // Se puede hacer otro tipo de mensaje de fin de juego?
		}  else 
		game.say(self, "!Aún te faltan llaves!, prueba suerte abriendo los cofres ")
	}
}
