import wollok.game.*
import otros_obj.*

// NOTAS:

// Estos enemigos comparten las mismas caracteristicas pero van a diferir en la cantidad de vida y ataque que tienen, asi como tambien el objeto que 
// guardan, que puede ser un "HongoSalud" que varia en efecto o una llave , para que el jugador se vea obligado a atacarlos.


class Enemigo inherits NoColisionable {

	var property hp
	var property atk
	var position
	var contador = 0 //cuando el contador llega a 3, ataca al personaje y reinicia el contador. Va sumando uno cada vez que recibe un ataque.
	const inventario = [] 
	var imagen 
	
	method asignarPosicion(pos){position = pos}
	
	method image() = imagen
	
	method imagenAtk()
	
	method aniadir(objeto)= inventario.add(objeto)

	method serInteractuadoPor(jugador) {
		self.reciboAtaque(jugador)
	}
	
	method reciboAtaque(personaje) {
		var _imagen = imagen
		imagen = self.imagenAtk()
		game.onTick(200,"animacion ataque enemigo",{
			imagen = _imagen
			game.removeTickEvent("animacion ataque enemigo")
		})
		
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
		game.addVisualIn(inventario.head(),position)
		
	}
	
	method animacion() 
	method tipo() {return ""}
	
	method nacer(_hp,_atk) {
		hp = _hp
		atk = _atk
	}
}


// Estos objetos son para que los diferentes enemigos hereden sus respectivas imagenes para usar de animaciones.

class Bowser inherits Enemigo {
	
	override method imagenAtk() = "bowser_atk.png" //la imagen que se muestra cuando es atacado por el jugador
	
	override method tipo() = "bowser"
	
	override method animacion() {
		if(imagen == "bowser1.png") {
		imagen = "bowser2.png"
		} else {
			imagen = "bowser1.png"
		}	
	}
}

class Zelda inherits Enemigo {

	override method imagenAtk() = "zelda_atk.png" //la imagen que se muestra cuando es atacado por el jugador
	
	override method tipo() = "zelda"
	
	override method animacion() {
		if(imagen == "zelda1.png") {
		imagen = "zelda2.png"
		} else {
			imagen = "zelda1.png"
		}	
	}

}



class Pacman inherits Enemigo {

	override method imagenAtk() = "pacman_atk.png" //la imagen que se muestra cuando es atacado por el jugador
	
	override method tipo() = "pacman"
	
	override method animacion() {
		if(imagen == "pacman1.png") {
		imagen = "pacman2.png"
		} else {
			imagen = "pacman1.png"
		}	
	}
}

class Metroid inherits Enemigo {

	override method imagenAtk() = "metroid_atk.png" //la imagen que se muestra cuando es atacado por el jugador
	
	override method tipo() = "metroid"
	
	override method animacion() {
		if(imagen == "metroid1.png") {
		imagen = "metroid2.png"
		} else {
			imagen = "metroid1.png"
		}	
	}
}

class Donkey inherits Enemigo {

	override method imagenAtk() = "donkey_atk.png" //la imagen que se muestra cuando es atacado por el jugador
	
	override method tipo() = "donkey"
	
	override method animacion() {
		if(imagen == "donkey1.png") {
		imagen = "donkey2.png"
		} else {
			imagen = "donkey1.png"
		}	
	}
}

class MegaMan inherits Enemigo {
	
	override method imagenAtk() = "megaManH.png" //la imagen que se muestra cuando es atacado por el jugador
	
	override method tipo() = "megaMan"
	
	override method animacion() {
		if(imagen == "megaMan1.png") {
		imagen = "megaMan2.png"
		} else {
			imagen = "megaMan1.png"
		}	
	}
}
class Link inherits Enemigo{
	override method imagenAtk() = "link_atk.png" //la imagen que se muestra cuando es atacado por el jugador
	
	override method tipo() = "link"
	
	override method animacion() {
		if(imagen == "link1.png") {
		imagen = "link2.png"
		} else {
			imagen = "link1.png"
		}
	}
}