import wollok.game.*
import personaje.*
import otros_obj.*

class Arma inherits NoColisionable {
	
	var property mejoraAtk
	var property image
	var property position
	
	method serInteractuadoPor(jugador) {
		jugador.llevarArma(self)
		
	}
	
	method cambiarPosicionDelArma(pos) {
		//deberia ser la posicion del arma que estoy agarrando
		//la posicion del arma del inventario, la que sale en el menu, ya sabemos cual es
		game.addVisualIn(self,pos)
		}
}
