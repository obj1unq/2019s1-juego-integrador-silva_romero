import wollok.game.*
import personaje.*
import otros_obj.*

// USAR PARA CARGAR OBJETOS AL TABLERO?

object muro inherits NoColisionable {
	
	method image()= "muro.png"
	
	method cargar(){
		const ancho = game.width() - 1
		const largo = game.height() - 1
		var alrededores = []
		
		(0 .. ancho).forEach{ p => alrededores.add(new Position(p, largo))} // muros del lado superior
		(0 .. largo).forEach{ p => alrededores.add(new Position(ancho, p))} // muros del lado derecho
		(0 .. ancho).forEach{ p => alrededores.add(new Position(p, 0))} 	// muros del lado inferior
		(0 .. largo).forEach{ p => alrededores.add(new Position(0, p))}		// muros del lado izquierdo
		
		// SIRVE PARA AÑADIR COSAS EN POSICIONES ESPECIFICAS 
		// USARLO DESPUES PARA DISEÑAR MAS VISUALES EN EL TABLERO 
		//alrededores.addAll([new Position(3,5), new Position(4,5), new Position(5,5)])
		
		alrededores.forEach {direccion => game.addVisualIn(self,direccion)}
	}
	
	method serInteractuadoPor(jugador) {
		game.say(self, "si ves esto es porque hay algo mal ); resuelto con polimorfismo, pero en un futuro deberia no tener que recibir este mensaje")
	}
	
}

//object tesoro {
//	<!!> no corresponde que este dentro del archivo tablero
// Corresponde que exista una clase Cofre y a partir de esa clase se instancien cofres en Escape.wpgm
//	method image()= "cofre1.jpg"
//	
//	method cargar(){
//		var tesoros = []
//		
//		tesoros.addAll([new Position(3,12), new Position(6,12), new Position(12,12)])
//		
//		tesoros.forEach {direccion => game.addVisualIn(self,direccion)}
//	}
//	
//	method esLlevadoPor(personaje){
//		// no hace nada respeta el poliformismo
//	}
//}