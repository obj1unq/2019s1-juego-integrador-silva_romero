import wollok.game.*
import personaje.*
import otros_obj.*

// Las armas modifican el ataque , solo puede haber un arma por vez para el  personaje, si quiere otra arma, debe soltar la que ya tiene y reemplazarla



class Arma inherits Colisionable {
	
	var property tipo  // definir con un string para mejorar la identificacion en otros metodos
	var property mejoraAtk
	var property image
	
	
	method serInteractuadoPor(jugador) {
		// en un futuro deberia hacer que intercambie el arma, por ahora eso se encarga el boton e.
	}
	
}

// <!!> No hace falta crear clases por cada arma nueva, ya al instanciar de la clase arma se crea (en el Escape.wpgm)
//class Espada1 inherits Arma{
//}
//
//class Espada2 inherits Arma{
//}