
class Direccion {
	var animaciones
	method posicionAl(jugador) //Usado para comprobar los objetos que existen en esa direccion (relativa al jugador)
	//Usado junto con el metodo personaje.puedeMoverAl(dir)
}

object izquierda inherits Direccion { 

	method imagenDelPersonaje() = "left-pikachu.png"
	method imagenDelPersonajeAtacado()= "pika-atk-izq.png"	
	override method posicionAl(jugador) = jugador.position().left(1)
	

}

object derecha inherits Direccion { 
	method imagenDelPersonaje()= "right-pikachu.png" 
	method imagenDelPersonajeAtacado()= "pika-atk-der.png"
	override method posicionAl(jugador) = jugador.position().right(1)
	

}

object abajo inherits Direccion { 
	method imagenDelPersonaje()= "down-pikachu.png" 
	method imagenDelPersonajeAtacado()= "pika-atk-abajo.png"
	override method posicionAl(jugador) = jugador.position().down(1)
	
}

object arriba inherits Direccion { 
	method imagenDelPersonaje()="up-pikachu.png"
	method imagenDelPersonajeAtacado()= "pika-atk-arriba.png"
	override method posicionAl(jugador) = jugador.position().up(1)
	
}