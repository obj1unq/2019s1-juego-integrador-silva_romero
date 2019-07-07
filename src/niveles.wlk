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
import suelo.*
import numeros.*
class Nivel {

	

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
		personaje.nivelActual(self)
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
		self.cargarReloj()
		representacionMenu.teclasParaJugar()
	}
	method cargarReloj(){
		reloj.nivelActual(self)
		reloj.funcionando(seis, cero)
	}
	
	method animaciones() {
		game.onTick(500, "animacion enemigos", { observerEnemigos.update()})
	}

	method visuales()  // cada nivel maneja su propio visuales / fondo, enemigos, cofres

	method ganaste(){
		reloj.reiniciar()
		personaje.pasoDeNivel()
		representacionMenu.actualizar()
		self.siguienteNivel()		
	}  
	method siguienteNivel()
	method perdiste(){
		game.onTick(1000,"self",{
			game.clear()
			game.addVisual(resultado)
			self.reiniciar()
		})
	}
	
	method colocarSuelo(imagen){
		suelo.image(imagen)
		game.addVisual(suelo)
	}
	method reiniciar(){
		 keyboard.r().onPressDo {
			game.clear()
			personaje.restart()
			reloj.reiniciar()
			inicio.portada()
						}
	}
	method cantLlavesNecesarias()=3
}

object nivel1 inherits Nivel {
	
	

	override method siguienteNivel(){
		nivel2.cargar()
	}
	override method configuraciones(){
		self.colocarSuelo("textura1.jpg")
		super()
		
	}
	

	override method visuales() {
		
			// Muros
		muro.cargar("muro.png")
			// Puerta
		game.addVisual(new Puerta(nivelActual = self)) // posicion siempre menor o igual a (height - 2) (width - 2) 
		tablero.cargarCofresDelNivel1()
	}

}

object nivel2 inherits Nivel {
	override method siguienteNivel(){
		nivel3.cargar()
	}


	override method cargar() {
		game.clear()
		super()
	}
	override method configuraciones(){
		self.colocarSuelo("textura2.jpg")
		super()
	}
	override method visuales() {
		
		muro.cargar("muro2.jpg")
		game.addVisual(new Puerta(nivelActual = self)) // posicion siempre menor o igual a (height - 2) (width - 2) 
		tablero.cargarCofresDelNivel2()
	}
	
}

object nivel3 inherits Nivel {

	
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
		game.addVisual(new Puerta(nivelActual = self)) // posicion siempre menor o igual a (height - 2) (width - 2) 
		tablero.cargarCofresDelNivel3()
	}
	override method ganaste(){
		resultado.ganaste()
	}
	override method siguienteNivel(){
	 /// no hay mas niveles
	 }
}

