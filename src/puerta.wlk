import wollok.game.*
import otros_obj.*

object puerta inherits NoColisionable {
	
	method image()= "door.png" 
	
	method serInteractuadoPor(jugador) {
		//Si tiene 3 llaves, la abre y gana el juego. Si no, le dice "Faltan llaves."
		if (jugador.llavesObtenidas() == 3){
			game.say(self, "Ganaste!!")        // Se puede hacer otro tipo de mensaje de fin de juego? -> SI!! preguntarle a mel lo que tenemos pensado super top secret que te muestre cuando gane el juego ;)
		}  else 
		game.say(self, "!Aún te faltan llaves! Seguí buscando.")
	}
}
