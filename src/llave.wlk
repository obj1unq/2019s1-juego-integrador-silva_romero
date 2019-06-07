import wollok.game.*
import otros_obj.*

class Llave inherits Colisionable {
	
	method image() = ""
	
	method serRecogidaPor(personaje) {
		//cuando es recogida, suma 1 a la cantidad de llaves y desaparece la llave <!!>
		game.removeVisual(self)
		personaje.recogerLlave()
	}
	
	method serInteractuadoPor(jugador) {
		game.say(self, "si ves esto es porque hay algo mal ); resuelto con polimorfismo, pero en un futuro deberia no tener que recibir este mensaje")
	}
}