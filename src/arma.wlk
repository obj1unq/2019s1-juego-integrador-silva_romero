import wollok.game.*
import personaje.*
import otros_obj.*

class Arma inherits NoColisionable {
	
	var property mejoraAtk
	var property image
	
	method tipo() = "arma"
	
	method serInteractuadoPor(jugador) {
		jugador.llevarArma(self)
	}	
	
}
