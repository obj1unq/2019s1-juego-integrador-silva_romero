import wollok.game.*
import otros_obj.*

// NOTAS:

// Estos enemigos comparten las mismas caracteristicas pero van a diferir en la cantidad de vida y ataque que tienen, asi como tambien el objeto que 
// guarden. Uno de ellos va a tener una llave , para que el jugador se vea obligado a atacarlos.


class Enemigo inherits NoColisionable {
//	
	var property hp
	var property atk
	var property position 
	var contador = 0 //cuando el contador llega a 3, ataca al personaje y reinicia el contador. Va sumando uno cada vez que recibe un ataque.


	method image() = "golum.jpeg"
	
//	method colisionarCon(personaje){
//		// no hace nada respeta el poliformismo (GT)
//	} // <!!> no hace falta, nunca colisionara y nunca ejecuta. 

	method serInteractuadoPor(jugador) {
		self.reciboAtaque(jugador)
	}
	
	method reciboAtaque(personaje) {
		hp -= personaje.ataque()
		contador += 1
		self.atacoSiEsPosible(personaje)

		if (not self.sigoVivo()) {
			self.morir()
		}
	}
	

	method atacoSiEsPosible(personaje){
		if (contador == 3 ) {
			self.ataco(personaje)
			contador = 0
			}
		}
	
	method ataco(personaje){
		      personaje.esAtacado(atk)
	}

	method sigoVivo() {
		return hp > 0
	}

	method morir() {
		game.removeVisual(self)
	}


}