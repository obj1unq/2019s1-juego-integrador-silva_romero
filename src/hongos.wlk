import wollok.game.*
import otros_obj.*
import menu.*

class Hongo inherits Colisionable {
	 
	const property efecto
	
	method image() = "hongo.png"
	
	method tipo()
	
	method colisionConVidaAlPalo(personaje) {
		//Ejecuta solo si colisionando el personaje tiene toda la vida
		
		if (personaje.vida() == 10 && self.tipo() == "pocion") {game.say(self,"Ya tenés vida!")}
	}
	
	 method colisionarCon(personaje) {
		if (personaje.vida() != 10 or self.efecto() < 0) {
			// self.efecto() > 0 significa que es una pocion curativa y no un veneno.
			personaje.aplicarEfecto(self)
			game.removeVisual(self)
			representacionMenu.actualizar()
			}
		}
	
	
	method serInteractuadoPor(jugador) {
		game.say(jugador,"¿Qué pasará si la paso por encima?")
	}
	

}

class HongoSalud inherits Hongo{
	//Le suma vida al jugador (su efecto es positivo)	
	
	override method tipo() = "pocion" 

}

class HongoSeguro inherits HongoSalud {
 
	override method image() = "hongoSeguro.png"
	method crear()= new HongoSeguro(efecto = 2.randomUpTo(5).truncate(0))
}
	
class HongoVeneno inherits Hongo{
	// Le resta vida al jugador (su efecto es negativo)

	override method tipo() = "veneno" 
	
}
