import wollok.game.*
import otros_obj.*
import menu.*
class Llave inherits Colisionable {
	
	var position
	method position() = position
	method image() = "llave.png"
	
	method tipo() = "llave" 
	
	method colisionarCon(personaje) { 
		game.removeVisual(self)
		personaje.recogerLlave()
		representacionMenu.llavesAquiridas()
	}
	
	
	
	method serInteractuadoPor(jugador) {
		//Respeta el polimorfismo
	}
}