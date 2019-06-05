import wollok.game.*

// NOTAS:
// van a existir pociones y venenos que afecten la vida.

class Frasco{
	
	var property tipo = "salud" // es de ejemplo pero los tipos serian  de salud ,atk, o si son venenos antisalud (ponele)
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
