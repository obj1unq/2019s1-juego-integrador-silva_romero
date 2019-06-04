import wollok.game.*
import personaje.*

// Las armas modifican el ataque , solo puede haber un arma por vez para el  personaje, si quiere otra arma, debe soltar la que ya tiene y reemplazarla



class Arma{
	
	var property tipo  // definir con un string para mejorar la identificacion en otros metodos?
	var property mejoraAtk = 0
	var property image
	
	
	method esLlevadoPor(personaje){
		// no hace nada respeta el poliformismo
	}
	
}


class Espada1 inherits Arma{
	
	
}

class Espada2 inherits Arma{
	
	
}