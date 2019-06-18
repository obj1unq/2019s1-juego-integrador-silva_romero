import otros_obj.* //importar para conseguir el fondo negro
import reloj.* //vacio por ahora
import personaje.*
import llave.*
import wollok.game.*
//La barra de estatus que va sobre el area de juego
//Muestra la vida, el ataque y la cantidad de llaves que tiene el jugador en el momento actual

//El jugador tiene como maximo 10 puntos de vida, representado como medio corazon = 1 punto de vida (o 5 corazones en total)
//puede juntar como maximo 3 llaves
//tiene como maximo 1 arma en el inventario, de la cual puedo ver en grande cuanto ataque hago
//Hay un temporizador
//Esta representado en cual nivel del juego estoy

//el arma y las llaves ya estan representadas con imagenes y se pueden obtener de las clases Arma y Llave

//puntos de vida y de ataque estan representados en el personaje pero no estan representados con imagenes, asi que hay que crear clases
//para representarlos


class Corazon{
	var property puntosDelPersonaje= personaje.vida()
	var property image = "corazon.png"
	var property position  
		
	method corazonCompleto() {image  ="corazon.png"	}
	method corazonMitad(){ image = "corazonMitad.png" }	
	
	method corazonVacio(){image ="corazonVacio.png"}			
}

//
object representacionMenu{
	const corazones = (1..5).map { i => new Corazon() }
	
	method actualizar() {
		self.actualizarVida()
		self.armaActual()
	}
		
	method cargarCorazones(){
		var i = 8
		corazones.forEach { 
			corazon => game.addVisualIn(corazon, game.at(i,11))
			i += 1 
		}
	}
	
	method actualizarVida() {
		var vida = personaje.vida()
		corazones.forEach{ corazon =>
			if (vida >= 2) {
				corazon.corazonCompleto()
				vida -= 2
			} else if (vida == 1) {
				corazon.corazonMitad()
				vida -= 1
			} else corazon.corazonVacio()
		}
	}
	
	method llavesAquiridas() {
		if (personaje.llavesObtenidas() == 1) {
			game.addVisualIn(new Llave(), game.at(0, 11))
		} else if (personaje.llavesObtenidas() == 2) {
			game.addVisualIn(new Llave(), game.at(1, 11))
		} else if ((personaje.llavesObtenidas()) == 3) {
			game.addVisualIn(new Llave(), game.at(2, 11))
		}
	}
	
	method armaActual(){
		if (not (personaje.inventario().isEmpty()) ){
		personaje.inventario().head().cambiarPosicionDelArma(game.at(4,11))
		//game.addVisualIn(personaje.inventario().head(),)
	}
	}
	method juegoTermino (){
		if (personaje.vida() <= 0){
			game.stop()
			///cierra todo el juego. Buscar imagen que represente que perdio el juego 
			//clear() no funciono.
		}
	}
}
////cuando el personaje pierda o gane, que solo se muestre en el menu 
	

	
	



