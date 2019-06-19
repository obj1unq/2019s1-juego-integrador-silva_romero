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
	//simple factory. Se usa para crear enemigos, pociones, venenos, llaves bombas y mas! (GT)
	// AUNQUE EN ALGUNOS DE ESTOS METODOS HAY QUE MODIFICARLOS PARA QUE SE PUEDAN LOGRAR LAS ANIMACIONES. 
	// perdon leo... :)
	
	method crearEnemigo(imag){
		
		return new Enemigo(hp = 4.randomUpTo(12).truncate(0), atk= 1.randomUpTo(4).truncate(0), imagen = imag)
		
		
		// PARA QUE PUEDA CREARSE EL ENEMIGO NECESITO UN RETURN, ESTO DEBERIA ESTAR EN OTRO LADO, RESOLVER (GT)
		//const _enemigo = new Enemigo(hp =1.randomUpTo(4).truncate(0),atk= 1.randomUpTo(12).truncate(0))
		//game.addVisual(_enemigo)
		//game.hideAttributes(_enemigo) //- NO SACAR ESTO, lo comente porque tests pero cuando terminemos todo descomentarlo
	
	//	observerEnemigos.observar(_enemigo) -> Comento esto porque al no tener un return no puedo asignar a los enemigos al cofre (GT)
	}
	
//	method crearBomba() {
//		return new Bomba()
		
		// PARA QUE PUEDA CREARSE LA BOMBA NECESITO UN RETURN, ESTO DEBERIA ESTAR EN OTRO LADO, RESOLVER (GT)
		/* 
		const _bomba = new Bomba(position = pos)//Este crearBomba deberia llamarlo el cofre, el cual le pasa su posición
		game.addVisual(_bomba)
		game.say(_bomba,"CUIDADO!!!")
		game.onTick(500,"explosion muy explosionadora",_bomba.explotar())
		*/		
//	}
	
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
		return new Arma(image = img, mejoraAtk = 2.randomUpTo(6).truncate(0))// POR AHORA GENERAN CUALQUIER NIVEL DE ATK, DESPUES SE ESPECIFICARA SEGUN LOS NIVELES DEL JUEGO (GT)
		
	}
	
}



// OBJETO CON METODOS PARA CREAR LOS DISTINTOS TIPOS DE COFRES

object factoryCofre {
	// Notas GT:
	// Las listas son para que al crear un arma o enemigo se asigne aleatoriamente las imagenes, asi como tambien los demas atributos.
	// Esta es una fase alpha, esta demasiado aleatorio, puede o no funcionar , ademas que en cada nivel se especificara el rango de valores que tendran los diferentes atributos.
	// Resolvi lo de los cofres colisionados(en teoria)
	// Las imagenes son de ejemplo. Definir las imagenes a utilizar y borrar las que ya no sirvan.
	
	
	
	var imagenesEnemigos = ["golum.jpeg","jack2.png","dragon.png"] 
	var imagenesArmas = ["espada1.png","espada2.png","palo.png","iron_sword.png"]
	
	method crearCofreEnemigo(pos) { 
		if(game.getObjectsIn(pos).isEmpty()){
			const _cofre = new Cofre(
				position = pos,
				contenido = factory.crearEnemigo(imagenesEnemigos.get(0.randomUpTo(imagenesEnemigos.size()).truncate(0)))
			) 
			game.addVisual(_cofre)
			game.hideAttributes(_cofre)
		}else{
			self.crearCofreEnemigo(game.at(1.randomUpTo(game.width() - 1).truncate(0),1.randomUpTo(game.height() - 5).truncate(0)))
		}
	
	}
	
	method crearCofrePocion(pos) {
		if(game.getObjectsIn(pos).isEmpty()){
			const _cofre = new Cofre(
				position = pos,
				contenido = factory.crearPocion()
			)
			game.addVisual(_cofre)
			game.hideAttributes(_cofre)
		}else{
			self.crearCofrePocion(game.at(1.randomUpTo(game.width() - 1).truncate(0),1.randomUpTo(game.height() - 5).truncate(0)))
		}
	}
	
	method crearCofreVeneno(pos) {
		if(game.getObjectsIn(pos).isEmpty()){
			const _cofre = new Cofre(
				position = pos,
				contenido = factory.crearVeneno()
			)
			game.addVisual(_cofre)
			game.hideAttributes(_cofre)
		}else{
			self.crearCofreVeneno(game.at(1.randomUpTo(game.width() - 1).truncate(0),1.randomUpTo(game.height() - 5).truncate(0)))
		}
	}
	
	method crearCofreLlave(pos) {
		if(game.getObjectsIn(pos).isEmpty()){
			const _cofre = new Cofre(
				position = pos,
				contenido = factory.crearLlave()
			)
			game.addVisual(_cofre)
			game.hideAttributes(_cofre)
		}else{
			self.crearCofreLlave(game.at(1.randomUpTo(game.width() - 1).truncate(0),1.randomUpTo(game.height() - 5).truncate(0)))
		}
	}
	
//	method crearCofreBomba(pos) {
//		if(game.getObjectsIn(pos).isEmpty()){
//			const _cofre = new Cofre(
//				position = pos,
//				contenido = factory.crearBomba()
//		)
//			game.addVisual(_cofre)
//		}else{
//			self.crearCofreBomba(game.at(1.randomUpTo(game.width() - 1).truncate(0),1.randomUpTo(game.height() - 5).truncate(0)))
//		}
//	}
	
	
	method crearCofreArma(pos) { 
		if(game.getObjectsIn(pos).isEmpty()){
			const _cofre = new Cofre(
				position = pos,
				contenido = factory.crearArma(imagenesArmas.get(0.randomUpTo(imagenesArmas.size()).truncate(0)))
		)
			game.addVisual(_cofre)
			game.hideAttributes(_cofre)
		}else{
			self.crearCofreArma(game.at(1.randomUpTo(game.width() - 1).truncate(0),1.randomUpTo(game.height() - 5).truncate(0)))
		}
	}
	
}