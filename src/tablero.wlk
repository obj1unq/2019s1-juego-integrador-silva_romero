import wollok.game.*
import personaje.*

object tablero {
	
	method image()= "muro.png"
	
	method ponerMuros(){
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
}
