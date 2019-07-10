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
	
	method crearEnemigo(enemigo,vidaMin,vidaMax,objeto,pos){
		var _enemigo = enemigo.crear()
	
		//_enemigo.nacer ( vida, ataque )
		_enemigo.nacer( vidaMin.randomUpTo(vidaMax).truncate(0) , 2.randomUpTo(5).truncate(0) )
		_enemigo.aniadir(objeto)
		_enemigo.asignarPosicion(pos)
		observerEnemigos.observar(_enemigo) 
		
		return _enemigo
	}
	
	
}

// OBJETO CON METODOS PARA CREAR LOS DISTINTOS TIPOS DE COFRES

object factoryCofre {
	
	var property enemigosPosibles = [] 
	var property imagenesArmas = []

	
	
	method crearCofreDe(objeto,pos){
		if(game.getObjectsIn(pos).isEmpty()){
			const _cofre = new Cofre(
				position = pos,
				contenido = objeto)
			game.addVisual(_cofre)
			game.hideAttributes(_cofre)
		}else{
			self.crearCofreDe
(objeto,game.at(1.randomUpTo(game.width() - 1).truncate(0),1.randomUpTo(game.height() - 5).truncate(0)))
		}
	}


	
	
	
	method crearCofreEnemigo(pos,vidaMin,vidaMax,objeto) { 
		
	
		if(game.getObjectsIn(pos).isEmpty()){
			const _cofre = new Cofre(
				position = pos,
				contenido = factory.crearEnemigo(enemigosPosibles.get(0.randomUpTo(enemigosPosibles.size()).truncate(0)),vidaMin,vidaMax,objeto,pos)
			
			) 
			game.addVisual(_cofre)
			game.hideAttributes(_cofre)
		}else{
			self.crearCofreEnemigo(game.at(1.randomUpTo(game.width() - 1).truncate(0),1.randomUpTo(game.height() - 5).truncate(0)),vidaMin,vidaMax,objeto)
		}
	}
	

	
	
	
	


	

	
}