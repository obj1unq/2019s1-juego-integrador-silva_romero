import wollok.game.*
import otros_obj.*
import menu.*
import personaje.*

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
		game.say(personaje,"¿Qué pasará si la paso por encima?")
	}
	
}
