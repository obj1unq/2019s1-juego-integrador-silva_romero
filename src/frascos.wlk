import wollok.game.*

// NOTAS:
// van a existir pociones y venenos que afecten la vida.

class Frasco{
	
	var property tipo = "frasco"
	const property efecto
	
	method image() = "potion.png"
	
	method esLlevadoPor(personaje){
		personaje.aplicarEfecto(self)
		game.removeVisual(self)
	}
	
	
	
}

class PotenciadorHP inherits Frasco{
	
	  
}

class PotenciadorAtk inherits Frasco{
	
}

class Veneno inherits Frasco{
	
	
}
