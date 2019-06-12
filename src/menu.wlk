import otros_obj.* //importa para conseguir el fondo negro


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
	var property puntosDelPersonaje
	var image 
	method imagenQueMostrar()= if (puntosDelPersonaje > 2){ image = "corazonEntero.png"  puntosDelPersonaje -= 2} 
								else if (puntosDelPersonaje == 1){image = "medioCorazon.png" puntosDelPersonaje -=1}
								else image="muro.png"  
								
}
//object representacionVida{
	//var property lista = [new Corazon = corazon1,corazon2,corazon3,corazon3,corazon5 ]
	
	//method ejecutarVida(vidaPersonaje){lista.all({corazon1.puntosDelPersonaje(vidaPersonaje) 
	
//}

///Falta agregar las imagenes y el resto de menu
