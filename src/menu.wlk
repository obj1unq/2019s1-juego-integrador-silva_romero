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
class Corazon {

	var property puntosDelPersonaje = personaje.vida()
	var property image = "corazon.png"
	var property position

	method corazonCompleto() {
		image = "corazon.png"
	}

	method corazonMitad() {
		image = "corazonMitad.png"
	}

	method corazonVacio() {
		image = "corazonVacio.png"
	}

}

object representacionMenu {
	
	const corazones = (1 .. 5).map{ i => new Corazon()}
		
	method actualizar() {
		self.actualizarVida()
		self.llavesAquiridas()
		convertirNumero.actualizarAtaque()
	}
	method cargarObj(){
		self.cargarCorazones()
		game.addVisual(imagenDeVida)
		game.addVisual(imagenDeAtk)
	}

	method cargarCorazones() {
	
		var i = 8
		corazones.forEach{ corazon =>
			game.addVisualIn(corazon, game.at(i, 11))
			i += 1
			game.hideAttributes(corazon)
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
		var i = 0
		if (not personaje.llavesObtenidas().isEmpty()) {
			personaje.llavesObtenidas().forEach{ llave =>
				game.addVisualIn(llave, game.at(i, 11))
				i += 1
			}
		}
	}

}
//cuando el personaje pierda o gane, que solo se muestre en el menu 
	object convertirNumero{

	var property ultimoNumero
	const imageNumber = [cero, uno, dos, tres, cuatro, cinco, seis, siete, ocho, nueve]
	

    method obtenerNumero(number){
    	ultimoNumero = imageNumber.get(number)
    	return ultimoNumero
    }
    method actualizarAtaque(){
    	game.removeVisual(ultimoNumero)	
    	game.addVisualIn(self.obtenerNumero(personaje.ataque()),game.at(8,12))
    }

	
}

object imagenDeVida{
	var property position = game.at(7,11)
	var property imagen = "hp.png"
}

object imagenDeAtk{
	var property position = game.at(7,12)
	var property imagen = "atk.png"
}
	
	



