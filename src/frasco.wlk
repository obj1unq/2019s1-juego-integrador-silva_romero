import wollok.game.*
import otros_obj.*

// NOTAS:
// van a existir pociones y venenos que afecten la vida.

class Frasco inherits Colisionable {
	 
	const property efecto
	
	method image() = "potion.png"
	
	 method colisionarCon(personaje) {  // USADO EN LA COLISION (GT)
		if (personaje.vida() != 10 or self.efecto() < 0) {
			//self.efecto() > 0 significa que es una pocion curativa y no un veneno.
		personaje.aplicarEfecto(self)
		game.removeVisual(self)
		}
	}
	
	method serInteractuadoPor(jugador) {
		//Esto esta aca porque polimorfismo, esta nomas para que no se rompa todo
	}
}

//class Pocion inherits Frasco{
	//La pocion es un frasco que suma vida al jugador (su efecto es positivo)
	// OBSOLETO (por ahora, depende como se hace lo de los cofres) 
//}

//class Veneno inherits Frasco{
	// El veneno es un frasco que resta vida al jugador (su efecto es negativo)
	// OBSOLETO (por ahora, depende como se hace lo de los cofres)
//}
