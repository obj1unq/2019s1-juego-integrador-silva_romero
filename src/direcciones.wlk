
class Direccion {
	
	method posicionAl(jugador) //Usado para comprobar los objetos que existen en esa direccion (relativa al jugador)
	//Usado junto con el metodo personaje.puedeMoverAl(dir)
}

object izquierda inherits Direccion { 
	method imagenDelPersonaje() = "left-pikachu.png"
	
	override method posicionAl(jugador) = jugador.position().left(1)
	

}

object derecha inherits Direccion { 
	method imagenDelPersonaje()= "right-pikachu.png" 
	
	override method posicionAl(jugador) = jugador.position().right(1)
	

}

object abajo inherits Direccion { 
	method imagenDelPersonaje()= "down-pikachu.png" 
	
	override method posicionAl(jugador) = jugador.position().down(1)
	
}

object arriba inherits Direccion { 
	method imagenDelPersonaje()="up-pikachu.png"
	
	override method posicionAl(jugador) = jugador.position().up(1)
	
}