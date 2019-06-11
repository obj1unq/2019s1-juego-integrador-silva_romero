//A partir de la info de aca se construyen los niveles.
//Si usamos algun factory, ponerlo aca.


class Nivel {	
	
	method serGenerado() {
		//Generar significa popular el mapa con N cantidad de cofres, con N cantidad de obstaculos y 
		//con tamaño de N de alto x N de ancho, y actualizando la variable nivelActual del obj puerta.
		
		//Como el wollokGame se genera con un height y width que no se puede cambiar, lo que cambia es la posicion de los muros
		//y el spread de los objetos dentro del area de juego. Tambien casillas en negro por fuera del area de juego.
		
		//Para simplificar la implementacion un poco, el alto del area de juego siempre es la misma (con el menu que esta por encima,
		//que tampoco cambia de tamaño).
	
	
		//<??> Se le puede cambiar el game.ground() segun el nivel?? Preguntar a los profes	
	}
	
	
}


object nivel1 inherits Nivel {
	var ancho = 16 
	var cantCofres = 16 //falta decidir cuantos, no es definitivo
	var armasPosibles = []
	
	var rangoHpEnemigosMin = 4
	var rangoHpEnemigosMax = 12

}

object nivel2 inherits Nivel {
	var ancho = 22
	var cantCofres = 22 //falta decidir cuantos, no es definitivo
	var armasPosibles = []
	
	var rangoHpEnemigosMin = 6
	var rangoHpEnemigosMax = 15
}

object nivel3 inherits Nivel {
	var ancho = 28
	var cantCofres = 28 //falta decidir cuantos, no es definitivo
	var armasPosibles = []
	
	var rangoHpEnemigosMin = 8
	var rangoHpEnemigosMax = 22
	
}




