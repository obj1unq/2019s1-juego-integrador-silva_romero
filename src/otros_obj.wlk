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

object factory {
	//simple factory. Por ahora solo se usa para crear enemigos pero podria usarse para crear mas cosas ;)
	
	method crearEnemigo(){
		
		return new Enemigo(hp =4.randomUpTo(12).truncate(0),atk= 1.randomUpTo(4).truncate(0)) // lo inicie en 4 porque aparecian enemigos muy faciles (GT)
		
		//const _enemigo = new Enemigo(hp =1.randomUpTo(4).truncate(0),atk= 1.randomUpTo(12).truncate(0))
		//game.addVisual(_enemigo)
		//game.hideAttributes(_enemigo) //- NO SACAR ESTO, lo comente porque tests pero cuando terminemos todo descomentarlo
	
	//	observerEnemigos.observar(_enemigo) -> Comento esto porque al no tener un return no puedo asignar a los enemigos al cofre (GT)
	}
	
	method crearBomba(pos) {
		const _bomba = new Bomba(position = pos)//Este crearBomba deberia llamarlo el cofre, el cual le pasa su posición
		game.addVisual(_bomba)
		game.say(_bomba,"CUIDADO!!!")
		game.onTick(500,"explosion muy explosionadora",_bomba.explotar())		
	}
	
	method crearPocion() {
		return new Pocion(efecto = 2.randomUpTo(5).truncate(0)) // ASIGNADO CON LOS VALORES DEL README, PUEDE CAMBIAR(GT)
	}
	
	method crearVeneno() {
		return new Veneno(efecto = 2.invert().randomUpTo(5.invert()).truncate(0)) // ASIGNADO CON LOS VALORES DEL README, PUEDE CAMBIAR(GT)
	}
	
	method crearLlave() {
		return new Llave()
	}
	
	method crearArma(img) {
		return new Arma(image = img, mejoraAtk = 2.randomUpTo(6).truncate(0))// POR AHORA GENERAN CUALQUIER NIVEL DE ATK, DESPUES SE ESPECIFICA SEGUN LOS NIVELES DEL JUEGO (GT)
		
	}
	
}

object factoryCofre {
	
	method crearCofreEnemigo() { // Falta implementacion para que asigne imagenes
		const _cofre = new Cofre(
			position = game.at(1.randomUpTo(game.width() - 1).truncate(0),1.randomUpTo(game.height() - 5).truncate(0)),
			contenido = factory.crearEnemigo()
		)
		game.addVisual(_cofre)
	}
	
	method crearCofrePocion() {
		const _cofre = new Cofre(
			position = game.at(1.randomUpTo(game.width() - 1).truncate(0),1.randomUpTo(game.height() - 5).truncate(0)),
			contenido = factory.crearPocion()
		)
		game.addVisual(_cofre)
	}
	
	method crearCofreVeneno() {
		const _cofre = new Cofre(
			position = game.at(1.randomUpTo(game.width() - 1).truncate(0),1.randomUpTo(game.height() - 5).truncate(0)),
			contenido = factory.crearVeneno()
		)
		game.addVisual(_cofre)
	}
	
		method crearCofreLlave() {
		const _cofre = new Cofre(
			position = game.at(1.randomUpTo(game.width() - 1).truncate(0),1.randomUpTo(game.height() - 5).truncate(0)),
			contenido = factory.crearLlave()
		)
		game.addVisual(_cofre)
	}
	
	/* 
	method crearCofreArma() { // Falta implementacion para que asigne imagenes
		const _cofre = new Cofre(
			position = game.at(1.randomUpTo(game.width() - 1).truncate(0),1.randomUpTo(game.height() - 5).truncate(0)),
			contenido = factory.crearArma()
		)
		game.addVisual(_cofre)
	}
	*/
	
	
}