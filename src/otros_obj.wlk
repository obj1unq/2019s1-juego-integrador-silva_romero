import wollok.game.*

import enemigo.*
import bomba.*
import llave.*
import frasco.*
import arma.*

import cofre.*

//Superclases para que todos los objetos hereden de aca


//Que un objeto sea colisionable quiere decir que el jugador lo puede pasar por encima
//Metodos usados dentro de personaje.mover(pos, dir)


class NoColisionable {
	method esColisionable() = false
	
}

class Colisionable {
	method esColisionable() = true
	
}

class FondoNegro {
	method image() = "negro.png"
}

object repeat {
	//uso : repeat.cant( numero, bloque de codigo )
	//Repite el codigo n veces.
	//PRECONDICION: No le puedo pasar 0 como parametro (ej. repeat.cant(0,{etc}) NO!)
	method cant(n,bloque) {
		var contador = n
		
		if (contador > 1) {
			bloque.apply()
			self.cant(contador-1,bloque)
		} else {
			bloque.apply()
		}
		
	}
	

}


object observerEnemigos {
	//Mantiene un registro de todos los enemigos que se van creando.
	//Necesito guardarme todos los enemigos para ponerles animación, para que se actualicen sus imagenes cada X tiempo.
	const enemigos = []
	
	method update() {
		enemigos.forEach {enemigo=> enemigo.animacion() }
	}
	
	method observar(unEnemigo) {
		enemigos.add(unEnemigo)
	}
	
	method eliminar(unEnemigo) {
		enemigos.remove(unEnemigo)
	}
}

