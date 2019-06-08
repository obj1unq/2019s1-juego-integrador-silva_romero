import wollok.game.*
import personaje.*
import otros_obj.*

// Las armas modifican el ataque , solo puede haber un arma por vez para el  personaje, si quiere otra arma, debe soltar la que ya tiene y reemplazarla



class Arma inherits NoColisionable {
	
	var property mejoraAtk
	var property image
	
	
	method serInteractuadoPor(jugador) {
		jugador.llevarArma(self)
		
	}
	
}
