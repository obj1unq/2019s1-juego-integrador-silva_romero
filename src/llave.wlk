import wollok.game.*
import otros_obj.*

class Llave inherits Colisionable {
	
	var position
	method position() = position
	method image() = "llave.png"
	
	method colisionarCon(personaje) { // USADO EN LA COLISION (GT)
		game.removeVisual(self)
		personaje.recogerLlave()
	}
	
	
	
	method serInteractuadoPor(jugador) {
		//Esto esta aca porque polimorfismo, esta nomas para que no se rompa todo
	}
}