import wollok.game.*

// NOTAS:

// Estos enemigos comparten las mismas caracteristicas pero van a diferir en la cantidad de vida y ataque que tienen, asi como tambien el objeto que 
// guarden. Uno de ellos va a tener una llave , para que el jugador se vea obligado a atacarlos.


class Enemigo{
	
	var property hp
	var property atk
	var property position 
	
	method image() = "golum.jpeg"
	
	method esLlevadoPor(personaje){
		// no hace nada respeta el poliformismo
	}

	method serAtacado() {}	
	
}