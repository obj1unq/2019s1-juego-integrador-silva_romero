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
	var contador = 0
	method image() = "golum.jpeg"
	
	method esLlevadoPor(personaje){
		// no hace nada respeta el poliformismo
	}

	method serInteractuadoPor(jugador) {
		game.say(self, "si ves esto es porque hay algo bien! :D falta implementar mecanismos de ataque.")
	}
	method reciboAtaque(personaje){
		hp -= personaje.ataque()
		contador += 1
		self.atacoSiEsPosible(personaje)
	}
	method atacoSiEsPosible(personaje){
		if (contador == 3 )
			self.ataco(personaje)
			contador = 0
			}
	
	method ataco(personaje){
		      personaje.esAtacado(atk)
	}


}