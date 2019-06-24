import wollok.game.*
import otros_obj.*


class Hongo inherits Colisionable {
	 
	const property efecto
	
	method image() = "hongo.png"
	
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

class HongoSalud inherits Hongo{
	//Le suma vida al jugador (su efecto es positivo)	
	
	override method tipo() = "pocion" 
}

class HongoVeneno inherits Hongo{
	// Le resta vida al jugador (su efecto es negativo)

	override method tipo() = "veneno" 
}