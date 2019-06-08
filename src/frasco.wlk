import wollok.game.*
import otros_obj.*

// NOTAS:
// van a existir pociones y venenos que afecten la vida.

class Frasco inherits Colisionable {
	 
	const property efecto
	
	method image() = "potion.png"
	
	 method serBebidoPor(personaje){
	 	//<??> SI CAMBIO EL NOMBRE A COLISIONASTECON, Y LITERAL, NOMAS CAMBIO EL NOMBRE, SE ROMPE TODO!!
		//Ser colisionado significa ser bebido
		personaje.aplicarEfecto(self)
		game.removeVisual(self)
	}
	
	method serInteractuadoPor(jugador) {
		//Esto esta aca porque polimorfismo, esta nomas para que no se rompa todo
	}
}

class Pocion inherits Frasco{
	//La pocion es un frasco que suma vida al jugador (su efecto es positivo)
	  
}

class Veneno inherits Frasco{
	// El veneno es un frasco que resta vida al jugador (su efecto es negativo)
	
}
