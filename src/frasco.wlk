import wollok.game.*
import otros_obj.*


class Frasco inherits Colisionable {
	 
	const property efecto
	
	method image() = "potion.png"
	
	method tipo() = ""
	
	 method colisionarCon(personaje) {  
		if (personaje.vida() != 10 or self.efecto() < 0) {
			//self.efecto() > 0 significa que es una pocion curativa y no un veneno.
		personaje.aplicarEfecto(self)
		game.removeVisual(self)
		
		}
	}
	
	method serInteractuadoPor(jugador) {
		//Respeta el polimorfismo
	}
}

class Pocion inherits Frasco{
	//La pocion es un frasco que suma vida al jugador (su efecto es positivo)	
	
	override method tipo() = "pocion" //tipo de contenido en un cofre
}

class Veneno inherits Frasco{
	// El veneno es un frasco que resta vida al jugador (su efecto es negativo)

	override method tipo() = "veneno" //tipo de contenido en un cofre
}