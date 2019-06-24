//A partir de la info de aca se construyen los niveles.
import wollok.game.*
import otros_obj.*
import menu.*
import reloj.*
import obstaculos.*
import puerta.*
import bomba.*
import direcciones.*
import personaje.*
import resultado.*
import cofre.*
import hongos.*
import enemigo.*
import arma.*
import llave.*
import tablero.*
import inicio.*

class Nivel {

	method tipo()

	method cargar() {
		self.configuraciones()
		self.menu()
		self.personaje()
		self.movimientos()
		self.animaciones()
		self.visuales() // para cada nivel
	}


	method configuraciones() {
		representacionMenu.generarFondo()
	}

	method personaje() {
		// Personaje
		game.addVisual(personaje)
		game.hideAttributes(personaje)
		// Colisiones 
		game.whenCollideDo(personaje, { 
			objeto => objeto.colisionarCon(personaje)
			
		}) // Los unicos obj. con los que puede colisionar son llaves o hongos.	
	}

	method movimientos() {
		
		keyboard.up().onPressDo{ personaje.mover(personaje.position().up(1), arriba)}
		keyboard.down().onPressDo{ personaje.mover(personaje.position().down(1), abajo)}
		keyboard.left().onPressDo{ personaje.mover(personaje.position().left(1), izquierda)}
		keyboard.right().onPressDo{ personaje.mover(personaje.position().right(1), derecha)}
		keyboard.space().onPressDo{ personaje.interactuar()}

	}

	method menu() {
		representacionMenu.actualizarVida()
		representacionMenu.cargarObj()
		
		reloj.funcionando(seis, cero)
	}

	method animaciones() {
		game.onTick(500, "animacion enemigos", { observerEnemigos.update()})
	}

	method visuales() {
	} // cada nivel maneja su propio visuales / fondo, enemigos, cofres

	method ganaste()  // cada nivel maneja su propio ganaste 

	method reiniciar() {
		self.siPerdio()
		game.clear()
		reloj.reiniciar()
		personaje.reiniciar()
		self.cargar()
	}

	method siPerdio() {
		if (resultado.perdio()) {game.removeVisual(resultado)}
	}

	method perdiste() {
		game.clear()
		game.boardGround("gameOver.jpg")
	}
	
	

}

object nivel1 inherits Nivel {

	override method tipo() = 1

	override method ganaste() {
		nivel2.cargar()
		personaje.pasoDeNivel()
	}
	override method configuraciones(){
		super()
		game.ground("concreto.png")
	}
	

	override method visuales() {
		
			// Muros
		muro.cargar("muro.png")
			// Puerta
		game.addVisualIn(new Puerta(nivelActual = self), game.at(19, 8)) // posicion siempre menor o igual a (height - 2) (width - 2) 
		tablero.cargarCofresDelNivel1()
	}

}

object nivel2 inherits Nivel {

	override method tipo() = 2

	override method cargar() {
		game.clear()
		super()
	}
	override method configuraciones(){
		game.ground("suelo2.jpg")
		super()
	}
	override method visuales() {
		
		muro.cargar("muro2.jpg")
		game.addVisualIn(new Puerta(nivelActual = self), game.at(19, 8)) // posicion siempre menor o igual a (height - 2) (width - 2) 
		tablero.cargarCofresDelNivel2()
	}
	override method ganaste() {
		nivel3.cargar()
		personaje.pasoDeNivel()
	}
}

object nivel3 inherits Nivel {

	override method tipo() = 3
	override method configuraciones(){
		game.ground("suelo3.jpg") 
		super()
	}
	
	override method cargar() {
		game.clear()
		super()
	}
	
	override method visuales() {
		
		muro.cargar("muro3.jpeg") 
		game.addVisualIn(new Puerta(nivelActual = self), game.at(19, 8)) // posicion siempre menor o igual a (height - 2) (width - 2) 
		tablero.cargarCofresDelNivel3()
	}
	override method ganaste(){
		resultado.ganaste()
	}
}

