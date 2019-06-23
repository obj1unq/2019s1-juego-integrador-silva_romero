import wollok.game.*
import otros_obj.*
import menu.*
class Llave inherits Colisionable {
	
	var position
	method position() = position
	method image() = "llave.png"
	
	method tipo() = "llave" //tipo de contenido en un cofre
	
	method colisionarCon(personaje) { // USADO EN LA COLISION (GT)
		game.removeVisual(self)
		personaje.recogerLlave()
		representacionMenu.llavesAquiridas()
	}
	
	
	
	method serInteractuadoPor(jugador) {
		//Esto esta aca porque polimorfismo, esta nomas para que no se rompa todo
	}
}