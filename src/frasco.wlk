import wollok.game.*
import otros_obj.*

// NOTAS:
// van a existir pociones y venenos que afecten la vida.

class Frasco inherits Colisionable {
	
	var property tipo = "salud" // es de ejemplo pero los tipos serian  de salud ,atk, o si son venenos antisalud (ponele)
	const property efecto
	
	method image() = "potion.png"
	
	method serBebidoPor(personaje){
		game.removeVisual(self)
		personaje.aplicarEfecto(self)
	}
	
	method serInteractuadoPor(jugador) {
		game.say(self, "si ves esto es porque hay algo mal ); resuelto con polimorfismo, pero en un futuro deberia no tener que recibir este mensaje")
	}
}

class Pocion inherits Frasco{
	//La pocion es un frasco que suma vida al jugador (su efecto es positivo)
	  
}

class Veneno inherits Frasco{
	// El veneno es un frasco que resta vida al jugador (su efecto es negativo)
	
}
