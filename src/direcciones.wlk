import wollok.game.*
class Direccion {
	var property imagenes = [self.imagenDelPersonajeAtacado(),self.imagenDelPersonaje()]
	method posicionAl(jugador) //Usado para comprobar los objetos que existen en esa direccion (relativa al jugador)
	method imagenDelPersonaje()							//Usado junto con el metodo personaje.puedeMoverAl(dir)
	method imagenDelPersonajeAtacado()
}

object izquierda inherits Direccion { 

override	method imagenDelPersonaje() = "left-pikachu.png"
override	method imagenDelPersonajeAtacado()= "pika-atk-izq.png"	
	override method posicionAl(jugador) = jugador.position().left(1)
}

object derecha inherits Direccion { 
override	method imagenDelPersonaje()= "right-pikachu.png" 
override	method imagenDelPersonajeAtacado()= "pika-atk-der.png"
	override method posicionAl(jugador) = jugador.position().right(1)
}


object abajo inherits Direccion { 
override	method imagenDelPersonaje()= "down-pikachu.png" 
override	method imagenDelPersonajeAtacado()= "pika-atk-abajo.png"
	override method posicionAl(jugador) = jugador.position().down(1)
}


object arriba inherits Direccion { 
override	method imagenDelPersonaje()="up-pikachu.png"
override	method imagenDelPersonajeAtacado()= "pika-atk-arriba.png"
	override method posicionAl(jugador) = jugador.position().up(1)
}