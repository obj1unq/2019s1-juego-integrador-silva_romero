import otros_obj.*
import wollok.game.*

//Aca se ponen los muros y otros obstaculos (piedras, etc).
//Los sprites del pokemon ruby son bastante robables ("Robar es un Arte", Confucio, 2010 D.C.)
//Dependiendo el nivel, es que tan grande es el espacio de juego, cuantos obstaculos se generan en el mapa y desde donde hasta donde
//se posicionan los muros.
	
object muro inherits NoColisionable {
	// <??> Esto es un obj, no una clase. Cuando voy creando posiciones nuevas en el tablero, cada nueva posicion crea un obj nuevo
	// o el muro entero es un solo obj???
	
	method image()= "muro.png"
	
	method cargar() {
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
		//Esto esta aca porque polimorfismo, esta nomas para que no se rompa todo
	}
	
}

//Agregar mas tipos de obstaculos
