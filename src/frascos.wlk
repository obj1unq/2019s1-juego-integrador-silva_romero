import wollok.game.*

// NOTAS:
// van a existir pociones y venenos que afecten la vida.

// otros son armas que modifican el ataque , solo puede haber un intem por personaje, si quiere otro debe soltar el que ya tiene. 

class Frasco{
	
	var efecto = 0
	
	method modificarEfecto(nuevoEfecto){
		efecto = nuevoEfecto
	}
	
	method serBebida(){
		game.removeVisual(self)
		return efecto
		
	}
	
	method image() = "potion.png"
	

	
	
	
	
}

class PotenciadorHP inherits Frasco{
	
	  
}

class PotenciadorAtk inherits Frasco{
	
}

class Veneno inherits Frasco{
	
	
}
