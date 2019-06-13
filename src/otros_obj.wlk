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
	
	method crearEnemigo(_hp,_atk,pos) {
		const _enemigo = new Enemigo(hp = _hp, atk = _atk) //no importa que no reciba posicion, con addVisualIn se la doy.
		game.addVisualIn(_enemigo,pos)
		//game.hideAttributes(_enemigo) //- NO SACAR ESTO, lo comente porque tests pero cuando terminemos todo descomentarlo
		observerEnemigos.observar(_enemigo)
	}
	
	method crearBomba(pos) {
		const _bomba = new Bomba(position = pos)//Este crearBomba deberia llamarlo el cofre, el cual le pasa su posición
		game.addVisual(_bomba)
		game.say(_bomba,"CUIDADO!!!")
		game.onTick(500,"explosion muy explosionadora",_bomba.explotar())		
	}
	
	method crearFrasco(_efecto) {
		return new Frasco(efecto = _efecto)
	}
	
	method crearLlave(pos) {
		return new Llave(position = pos)
	}
	
	method crearArma(img,atk) {
		return new Arma(image = img, mejoraAtk = atk)
		
	}
	
}

object factoryCofre {
	
	method crear(pos) {
		//esta en otro factory xq este puede que sea mas complejo de crear que las otras cosas
		//gonza modifica este y ponele los parametros que necesites <3 -leito
		const _cofre = new Cofre()
		game.addVisualIn(_cofre,pos)
	}
	
}