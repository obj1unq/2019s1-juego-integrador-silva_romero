
class Direccion {
	
//	method avanzarHacia(position) obsoleto
	method posicionAl(jugador) //Usado para comprobar los objetos que existen en esa direccion (relativa al jugador)
	//Usado junto con el metodo personaje.puedeMoverAl(dir)
}

object izquierda inherits Direccion { 
	method imagenDelPersonaje() = "left-pikachu.png"
	
	override method posicionAl(jugador) = jugador.position().left(1)
	
//	override method avanzarHacia(position) = position.left(1) 
//	method opuesto() = derecha //obsoleto
}

object derecha inherits Direccion { 
	method imagenDelPersonaje()= "right-pikachu.png"
	
	override method posicionAl(jugador) = jugador.position().right(1)
	
//	override method avanzarHacia(position) = position.right(1) 
//	method opuesto() = izquierda //obsoleto
}

object abajo inherits Direccion { 
	method imagenDelPersonaje()= "down-pikachu.png"
	
	override method posicionAl(jugador) = jugador.position().down(1)
	
//	override method avanzarHacia(position) = position.down(1) 
//	method opuesto() = arriba //obsoleto
}

object arriba inherits Direccion { 
	method imagenDelPersonaje()="up-pikachu.png"
	
	override method posicionAl(jugador) = jugador.position().up(1)
	
//	override method avanzarHacia(position) = position.up(1) 
//	method opuesto() = abajo //obsoleto
}