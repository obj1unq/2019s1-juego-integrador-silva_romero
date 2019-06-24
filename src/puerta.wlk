import wollok.game.*
import otros_obj.*
import niveles.*
import resultado.*
import inicio.*
import personaje.*

class Puerta inherits NoColisionable {
	const nivelActual

	method image()= "door.png" 

	method tipo() = "puerta"
	
	method serInteractuadoPor(jugador) {
			
		if (jugador.llavesObtenidas().size() == 3 && nivelActual.tipo() == 3) {
			game.clear()
			resultado.ganaste()
			game.addVisualIn(resultado,game.origin()) 
			
			keyboard.r().onPressDo { 
			game.clear()
			personaje.restart()
			inicio.portada()
		}
			
		}  else if (jugador.llavesObtenidas().size() == 3 && nivelActual.tipo() != 3) {
			game.say(self, "Pasaste de nivel!!")   
			nivelActual.ganaste()
		}  else {
		game.say(self, "¡Aún te faltan llaves! Seguí buscando.")
		}
	}
}
