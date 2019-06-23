import otros_obj.*
import wollok.game.*

//Aca se ponen los muros y otros obstaculos (piedras, etc).
//Los sprites del pokemon ruby son bastante robables ("Robar es un Arte", Confucio, 2010 D.C.)
//Dependiendo el nivel, es que tan grande es el espacio de juego, cuantos obstaculos se generan en el mapa y desde donde hasta donde
//se posicionan los muros.
object muro inherits NoColisionable {

	// <??> Esto es un obj, no una clase. Cuando voy creando posiciones nuevas en el tablero, cada nueva posicion crea un obj nuevo
	// o el muro entero es un solo obj???
	method image() = "muro.png"

	method cargar() {
		const ancho = game.width() - 1
		const largo = game.height() - 4
		var alrededores = []
		(0 .. ancho).forEach{ p => alrededores.add(new Position(p, largo))} // muros del lado superior
		(0 .. largo).forEach{ p => alrededores.add(new Position(ancho, p))} // muros del lado derecho
		(0 .. ancho).forEach{ p => alrededores.add(new Position(p, 0))} // muros del lado inferior
		(0 .. largo).forEach{ p => alrededores.add(new Position(0, p))} // muros del lado izquierdo
			// SIRVE PARA AÑADIR COSAS EN POSICIONES ESPECIFICAS 
			// USARLO DESPUES PARA DISEÑAR MAS VISUALES EN EL TABLERO 
			// alrededores.addAll([new Position(3,5), new Position(4,5), new Position(5,5)])
		alrededores.forEach{ direccion => game.addVisualIn(self, direccion)}
	}

	method serInteractuadoPor(jugador) {
	// Esto esta aca porque polimorfismo, esta nomas para que no se rompa todo
	}

}

class Obstaculo inherits NoColisionable {

	// Otros obstaculos que se generan en el tablero, aparte de los cofres.
	
	method serInteractuadoPor(jugador) {
	// Esto esta aca porque polimorfismo, esta nomas para que no se rompa todo
	}
	
	method crear(pos) {
		// Genera un obstaculo en el tablero. Si ya hay algo en esa posicion, intenta generar en otra posición.
		if (game.getObjectsIn(pos).isEmpty()) {
			game.addVisualIn(self, pos)
		} else {
			self.crear(pos)
		}
	}
}

class Obstaculo1 inherits Obstaculo {

	// nivel 1
	method image() = "obstaculo1.png"

}

class Obstaculo2 inherits Obstaculo {

	// nivel 2
	method image() = "obstaculo2.png"

}

class Obstaculo3 inherits Obstaculo {

	// nivel 3
	method image() = "obstaculo3.png"

}

object factoryObstaculos {
	
	//no deberia pasarle width y height, deberia pasarle valores acorde al ancho y alto del nivel <!!>
	method posRandom() = new Position(1.randomUpTo(game.width() - 1).truncate(0), 1.randomUpTo(game.height() - 5).truncate(0))
	
	method nivel1(n) {
		// factoryObstaculos.nivel1(n) genera n obstaculos en el tablero
		repeat.cant(n, {
			const obs = new Obstaculo1()
			obs.crear(self.posRandom())
		})
	}
	
	method nivel2(n) {
		// factoryObstaculos.nivel2(n) genera n obstaculos en el tablero
		repeat.cant(4, {
			const obstaculo = new Obstaculo1()
			obstaculo.crear()
		})
	}
	
	method nivel3(n) {
		// factoryObstaculos.nivel3(n) genera n obstaculos en el tablero
		repeat.cant(n, {
			const obstaculo = new Obstaculo1()
			obstaculo.crear()
		})
	}
}

