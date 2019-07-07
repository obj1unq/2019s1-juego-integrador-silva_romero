import wollok.game.*
import otros_obj.*
import enemigo.*
import bomba.*
import llave.*
import hongos.*
import arma.*

import cofre.*


object factory {
	// Se usa para crear enemigos, pociones, venenos, llaves y bombas
	
	method crearEnemigo(tipo,vidaMin,vidaMax,objeto,pos){
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
		
		if(tipo=="link") {
			_enemigo = new Link()
		}
		if(tipo =="megaMan"){
			_enemigo = new MegaMan()
		}
		if(tipo =="dragon"){
			_enemigo = new Dragon()
		}
		//_enemigo.nacer ( vida, ataque )
		_enemigo.nacer( vidaMin.randomUpTo(vidaMax).truncate(0) , 2.randomUpTo(5).truncate(0) )
		_enemigo.aniadir(objeto)
		_enemigo.asignarPosicion(pos)
		observerEnemigos.observar(_enemigo) 
		
		return _enemigo
	}
	
	method crearBomba(pos) = new Bomba(position = pos) 		
		
	method crearHongoSeguro() = new HongoSeguro(efecto = 2.randomUpTo(5).truncate(0))	

	method crearSalud() {
		return new HongoSalud(efecto = 2.randomUpTo(5).truncate(0))	
	}
	
	method crearVeneno() {
		return new HongoVeneno(efecto = 2.invert().randomUpTo(5.invert()).truncate(0)) 
	}
	
	method crearLlave() = new Llave()
	
	
	method crearArma(img,atkMin,atkMax) {
		return new Arma(image = img, mejoraAtk = atkMin.randomUpTo(atkMax).truncate(0))
	}
	
}

// OBJETO CON METODOS PARA CREAR LOS DISTINTOS TIPOS DE COFRES

object factoryCofre {
	
	var property enemigosPosibles = [] 
	var property imagenesArmas = []
	
	method crearCofreEnemigo(pos,vidaMin,vidaMax) { 
		
	var hongo = factory.crearHongoSeguro()
		if(game.getObjectsIn(pos).isEmpty()){
			const _cofre = new Cofre(
				position = pos,
				contenido = factory.crearEnemigo(enemigosPosibles.get(0.randomUpTo(enemigosPosibles.size()).truncate(0)),vidaMin,vidaMax,hongo,pos)
			) 
			game.addVisual(_cofre)
			game.hideAttributes(_cofre)
		}else{
			self.crearCofreEnemigo(game.at(1.randomUpTo(game.width() - 1).truncate(0),1.randomUpTo(game.height() - 5).truncate(0)),vidaMin,vidaMax)
		}
	}
	
	method crearCofreEnemigoConLlave(pos,vidaMin,vidaMax) { 
	var llave = factory.crearLlave()
		if(game.getObjectsIn(pos).isEmpty()){
			const _cofre = new Cofre(
				position = pos,
				contenido = factory.crearEnemigo(enemigosPosibles.get(0.randomUpTo(enemigosPosibles.size()).truncate(0)),vidaMin,vidaMax,llave,pos)
			) 
			game.addVisual(_cofre)
			game.hideAttributes(_cofre)
		}else{
			self.crearCofreEnemigoConLlave(game.at(1.randomUpTo(game.width() - 1).truncate(0),1.randomUpTo(game.height() - 5).truncate(0)),vidaMin,vidaMax)
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
				contenido = factory.crearBomba(pos)
		)
			game.addVisual(_cofre)
			game.hideAttributes(_cofre)
		}else{
			self.crearCofreBomba(game.at(1.randomUpTo(game.width() - 1).truncate(0),1.randomUpTo(game.height() - 5).truncate(0)))
		}
	}
	
	method crearCofreArma(pos,atkMin,atkMax) { 
		if(game.getObjectsIn(pos).isEmpty()){
			const _cofre = new Cofre(
				position = pos,
				contenido = factory.crearArma(imagenesArmas.get(0.randomUpTo(imagenesArmas.size()).truncate(0)),atkMin,atkMax)
		)
			game.addVisual(_cofre)
			game.hideAttributes(_cofre)
		}else{
			self.crearCofreArma(game.at(1.randomUpTo(game.width() - 1).truncate(0),1.randomUpTo(game.height() - 5).truncate(0)),atkMin,atkMax)
		}
	}
	
}