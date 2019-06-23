import wollok.game.*
import otros_obj.*

import enemigo.*
import bomba.*
import llave.*
import hongos.*
import arma.*

import cofre.*


object factory {
	//simple factory. Se usa para crear enemigos, pociones, venenos, llaves, bombas y mas!
	
	method crearEnemigo(tipo,vidaMin,vidaMax){
		var _enemigo
		
		if(tipo=="bowser") {
			_enemigo = new Bowser()
		}
		
		if(tipo=="metroid") {
			_enemigo = new Metroid()
		}
		
		if(tipo=="zelda") {
			_enemigo = new Zelda()
		}
		
		if(tipo=="pacman") {
			_enemigo = new Pacman()
		}
		
		if(tipo=="donkey") {
			_enemigo = new Donkey()
		}
		
		//_enemigo.nacer ( hp, atk )
		_enemigo.nacer( vidaMin.randomUpTo(vidaMax).truncate(0) , 2.randomUpTo(5).truncate(0) )
		observerEnemigos.observar(_enemigo) 
		return _enemigo
	}
	
		
	
	
	
	
	method crearBomba() {
			return new Bomba() 		
		/* 
		const _bomba = new Bomba(position = pos)//Este crearBomba deberia llamarlo el cofre, el cual le pasa su posición
		game.addVisual(_bomba)
		game.say(_bomba,"CUIDADO!!!")
		game.onTick(500,"explosion muy explosionadora",_bomba.explotar())
		*/		
}	

	method crearSalud() {
		return new HongoSalud(efecto = 2.randomUpTo(5).truncate(0)) // ASIGNADO CON LOS VALORES DEL README, PUEDE CAMBIAR(GT)		
	}
	
	method crearVeneno() {
		return new HongoVeneno(efecto = 2.invert().randomUpTo(5.invert()).truncate(0)) // ASIGNADO CON LOS VALORES DEL README, PUEDE CAMBIAR(GT)
	}
	
	method crearLlave() {
		return new Llave()
	}
	
	method crearArmaNivel1(img) {
		return new Arma(image = img, mejoraAtk = 1.randomUpTo(3).truncate(0))
	}
	
	method crearArmaNivel2(img) {
		return new Arma(image = img, mejoraAtk = 2.randomUpTo(4).truncate(0))
	}
	
	method crearArmaNivel3(img) {
		return new Arma(image = img, mejoraAtk = 4.randomUpTo(6).truncate(0))
	}
	
}



// OBJETO CON METODOS PARA CREAR LOS DISTINTOS TIPOS DE COFRES

object factoryCofre {
	// Notas GT:
	// Las listas son para que al crear un arma o enemigo se asigne aleatoriamente las imagenes, asi como tambien los demas atributos.
	// Esta es una fase alpha, esta demasiado aleatorio, puede o no funcionar , ademas que en cada nivel se especificara el rango de valores que tendran los diferentes atributos.
	// Resolvi lo de los cofres colisionados(en teoria)
	// Las imagenes son de ejemplo. Definir las imagenes a utilizar y borrar las que ya no sirvan.
	
	// para los niveles
	
	var property enemigosPosibles = ["metroid","pacman"] 
	var property imagenesArmas = ["espada1.png","espada2.png","palo.png","iron_sword.png"]
	
	method enemigosPosibles(lista) {
		enemigosPosibles.addAll(lista)
	}
	
	method crearCofreEnemigo(pos,vidaMin,vidaMax) { 
		if(game.getObjectsIn(pos).isEmpty()){
			const _cofre = new Cofre(
				position = pos,
				contenido = factory.crearEnemigo(enemigosPosibles.get(0.randomUpTo(enemigosPosibles.size()).truncate(0)),vidaMin,vidaMax)
			) 
			game.addVisual(_cofre)
			//game.hideAttributes(_cofre)
		}else{
			self.crearCofreEnemigo(game.at(1.randomUpTo(game.width() - 1).truncate(0),1.randomUpTo(game.height() - 5).truncate(0)),vidaMin,vidaMax)
		}
	}
	
	
	method crearCofreSalud(pos) {
		if(game.getObjectsIn(pos).isEmpty()){
			const _cofre = new Cofre(
				position = pos,
				contenido = factory.crearSalud()
			)
			game.addVisual(_cofre)
			game.hideAttributes(_cofre)
		}else{
			self.crearCofreSalud(game.at(1.randomUpTo(game.width() - 1).truncate(0),1.randomUpTo(game.height() - 5).truncate(0)))
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
	
	method crearCofreBomba(pos) {
		if(game.getObjectsIn(pos).isEmpty()){
			const _cofre = new Cofre(
				position = pos,
				contenido = factory.crearBomba()
		)
			game.addVisual(_cofre)
			game.hideAttributes(_cofre)
		}else{
			self.crearCofreBomba(game.at(1.randomUpTo(game.width() - 1).truncate(0),1.randomUpTo(game.height() - 5).truncate(0)))
		}
	}
	
	
	method crearCofreArmaNivel1(pos) { 
		if(game.getObjectsIn(pos).isEmpty()){
			const _cofre = new Cofre(
				position = pos,
				contenido = factory.crearArmaNivel1(imagenesArmas.get(0.randomUpTo(imagenesArmas.size()).truncate(0)))
		)
			game.addVisual(_cofre)
			game.hideAttributes(_cofre)
		}else{
			self.crearCofreArmaNivel1(game.at(1.randomUpTo(game.width() - 1).truncate(0),1.randomUpTo(game.height() - 5).truncate(0)))
		}
	}
	
		method crearCofreArmaNivel2(pos) { 
		if(game.getObjectsIn(pos).isEmpty()){
			const _cofre = new Cofre(
				position = pos,
				contenido = factory.crearArmaNivel2(imagenesArmas.get(0.randomUpTo(imagenesArmas.size()).truncate(0)))
		)
			game.addVisual(_cofre)
			game.hideAttributes(_cofre)
		}else{
			self.crearCofreArmaNivel2(game.at(1.randomUpTo(game.width() - 1).truncate(0),1.randomUpTo(game.height() - 5).truncate(0)))
		}
	}
	
		method crearCofreArmaNivel3(pos) { 
		if(game.getObjectsIn(pos).isEmpty()){
			const _cofre = new Cofre(
				position = pos,
				contenido = factory.crearArmaNivel3(imagenesArmas.get(0.randomUpTo(imagenesArmas.size()).truncate(0)))
		)
			game.addVisual(_cofre)
			game.hideAttributes(_cofre)
		}else{
			self.crearCofreArmaNivel3(game.at(1.randomUpTo(game.width() - 1).truncate(0),1.randomUpTo(game.height() - 5).truncate(0)))
		}
	}
}
	
