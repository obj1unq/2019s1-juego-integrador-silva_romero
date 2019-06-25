import wollok.game.*
import otros_obj.*
import menu.*

class Hongo inherits Colisionable {
	 
	const property efecto
	
	method image() = "hongo.png"
	
	method tipo() = ""
	
	 method colisionarCon(personaje) {
		if (personaje.vida() != 10 or self.efecto() < 0) {
			// self.efecto() > 0 significa que es una pocion curativa y no un veneno.
			personaje.aplicarEfecto(self)
			game.removeVisual(self)
			representacionMenu.actualizar()
		} else if ((personaje.vida() == 10) && self.efecto() > 0) {
			game.onTick(0, "mensajeDeVidaLlena", { game.say(personaje, "vida suficiente!")
				game.removeTickEvent("mensajeDeVidaLlena")
			})
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

class HongoSeguro inherits HongoSalud {
	override method image() = "hongoSeguro.png"
}

class HongoVeneno inherits Hongo{
	// Le resta vida al jugador (su efecto es negativo)

	override method tipo() = "veneno" 
}