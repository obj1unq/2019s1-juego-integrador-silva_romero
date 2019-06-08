import wollok.game.*
import otros_obj.*

class Llave inherits Colisionable {
	
	method image() = "llave.png"
	
	method serColisionadoPor(personaje) {
		//Colisionar significa agarrar la llave
		//cuando es recogida, suma 1 a la cantidad de llaves y desaparece la llave <!!>
		game.removeVisual(self)
		personaje.recogerLlave()
	}
	
	method serInteractuadoPor(jugador) {
		//Esto esta aca porque polimorfismo, esta nomas para que no se rompa todo
	}
}