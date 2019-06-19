import wollok.game.*
import otros_obj.*

class Puerta inherits NoColisionable {
	var nivelActual

	method image()= "door.png" 
	
	method serInteractuadoPor(jugador) {
		//Si tiene 3 llaves, la abre y gana el juego. Si no, le dice "Faltan llaves."
		//<??> por que el say aparece en cualquier lado?
		
		if (jugador.llavesObtenidas().size() == 3 && nivelActual == 3) {
			game.say(self, "Ganaste el juego!!")        // Se puede hacer otro tipo de mensaje de fin de juego? -> SI!! preguntarle a mel lo que tenemos pensado super top secret que te muestre cuando gane el juego ;)
		}  else if (jugador.llavesObtenidas().size() == 3 && nivelActual != 3) {
			game.say(self, "Pasaste de nivel!!")        // Se puede hacer otro tipo de mensaje de fin de juego? -> SI!! preguntarle a mel lo que tenemos pensado super top secret que te muestre cuando gane el juego ;)
		}  else {
		game.say(self, "¡Aún te faltan llaves! Seguí buscando.")
		} //por que anide ifs, me preguntaras. La respuesta es sencilla: porque soy un malote :emoji-diablo:
	}
}
