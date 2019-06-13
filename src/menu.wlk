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
	var image 
	method imagenQueMostrar()= if (puntosDelPersonaje > 2){ image = "corazon.png"  puntosDelPersonaje -= 2} 
								else if (puntosDelPersonaje == 1){image = "corazonMitad.png" puntosDelPersonaje -=1}
								else image="muro.png"  
								
}
object representacionMenu{
	const corazon1= new Corazon()
	const corazon2= new Corazon()
	const corazon3= new Corazon()
	const corazon4= new Corazon()
	const corazon5= new Corazon()
	
	var property lista = [corazon1,corazon2,corazon3,corazon4,corazon5 ]
	method actualizarVida(){
		
	}
	/// falta metodo de vida
	
	
	
	
	method llavesAquiridas(){
		if (personaje.llavesObtenidas()  == 1){
			game.addVisualIn(new Llave(),game.at(1,11))
			}else if (personaje.llavesObtenidas() == 2){
			game.addVisualIn(new Llave(),game.at(2,11))
			}else if ((personaje.llavesObtenidas()) == 3) {
			game.addVisualIn(new Llave(),game.at(3,11))
			}
	}
}
	
	

	
	



