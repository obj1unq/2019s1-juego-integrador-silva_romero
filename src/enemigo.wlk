import wollok.game.*
import otros_obj.*

// NOTAS:

// Estos enemigos comparten las mismas caracteristicas pero van a diferir en la cantidad de vida y ataque que tienen, asi como tambien el objeto que 
// guarden. Uno de ellos va a tener una llave , para que el jugador se vea obligado a atacarlos.


class Enemigo inherits NoColisionable {

	var property hp
	var property atk
	var contador = 0 //cuando el contador llega a 3, ataca al personaje y reinicia el contador. Va sumando uno cada vez que recibe un ataque.
	
	var imagen 
	//var imagen = "golum.jpeg"
	method image() = imagen
	

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
		observerEnemigos.eliminar(self)
	}

	method animacion() {
		
		if(imagen == "golum.jpeg") {
		imagen = "jack2.png"
		} else {
			imagen = "golum.jpeg"
		}	
	}

}


// Estos objetos son para que los diferentes enemigos hereden sus respectivas imagenes para usar de animaciones.

object bowser {
	method imagen1() = "bowser1.png"
	method imagen2() = "bowser2.png"
	method imagenAtk() = "bowser_atk.png" //la imagen que se muestra cuando es atacado por el jugador
}

object zelda {
	method imagen1() = "zelda1.png"
	method imagen2() = "zelda2.png"
	method imagenAtk() = "zelda_atk.png" //la imagen que se muestra cuando es atacado por el jugador
	

}

object pacman {
	method imagen1() = "pacman1.png"
	method imagen2() = "pacman2.png"
	method imagenAtk() = "pacman_atk.png" //la imagen que se muestra cuando es atacado por el jugador
	
}

object metroid {
	method imagen1() = "metroid1.png"
	method imagen2() = "metroid2.png"
	method imagenAtk() = "metroid_atk.png" //la imagen que se muestra cuando es atacado por el jugador
	
}

object donkey {
	method imagen1() = "donkey1.png"
	method imagen2() = "donkey2.png"
	method imagenAtk() = "donkey_atk.png" //la imagen que se muestra cuando es atacado por el jugador
	
}