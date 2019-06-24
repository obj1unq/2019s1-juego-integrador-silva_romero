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

class Nivel {	
	method tipo()
	
	method start() {
			
			self.configuraciones()
			self.menu()
			self.personaje()
			self.movimientos()
			self.animaciones() 													
			self.visuales()	// para cada nivel
		}
		method configuraciones(){
			game.title("Escape : the pikachu's dungeon")
			game.height(14)
			game.width(22)
		}
		method personaje(){
			
		// Personaje
	 	game.addVisual(personaje)
	 	game.hideAttributes(personaje)
	 	
		// Colisiones 
		game.whenCollideDo(personaje,{objeto => objeto.colisionarCon(personaje)}) //Los unicos obj. con los que puede colisionar son llaves o hongos.	
		
		
		}		 
		method movimientos() {
		keyboard.up().onPressDo{ personaje.mover(personaje.position().up(1), arriba)}
		keyboard.down().onPressDo{ personaje.mover(personaje.position().down(1), abajo)}
		keyboard.left().onPressDo{ personaje.mover(personaje.position().left(1), izquierda)}
		keyboard.right().onPressDo{ personaje.mover(personaje.position().right(1), derecha)}
		keyboard.space().onPressDo{ personaje.interactuar()}
		
		
		keyboard.a().onPressDo{ game.say(personaje, personaje.ataque().toString())} // Para testings
		keyboard.v().onPressDo{ game.say(personaje, personaje.vida().toString())} // Para testings
		keyboard.l().onPressDo{ game.say(personaje, personaje.llavesObtenidas().toString())} // Para testings
		
		
		keyboard.o().onPressDo{ game.say(personaje, personaje.position().up(1).allElements().toString())}
		keyboard.r().onPressDo{ self.reiniciar()}
	}
		method menu() {
		game.addVisualIn(convertirNumero.obtenerNumero(personaje.ataque()),game.at(8,12)) //inicializa los valores de ataque 
		representacionMenu.actualizarVida()
		representacionMenu.cargarObj()
		game.addVisual(imagenDeVida)
		game.addVisual(imagenDeAtk)
		game.addVisual(relojRef)
	
		keyboard.any().onPressDo{ representacionMenu.actualizar()}
		reloj.funcionando(seis,cero)
	}
		method animaciones(){
		game.onTick(1000,"animacion enemigos", {observerEnemigos.update()} )
		}
		method visuales(){} // cada nivel maneja su propio visuales / fondo, enemigos, cofres
		
		
		
		method ganaste(){}	// cada nivel maneja su propio ganaste 
		 
		method reiniciar(){
			self.siPerdio()
			game.clear()
			reloj.reiniciar()
			self.start()
		}
		method siPerdio(){
			if (resultado.perdio())
				game.removeVisual(resultado)
		}
		method perdiste(){
			
			game.clear()
			game.boardGround("gameOver.jpg")
		}
}


object nivel1 inherits Nivel {
	
	
override method tipo() = 1
override method ganaste() {nivel2.start()}
override method start() {
				super()
				self.comienzo() // sin el nivel 1 no hay comienzo 
					}
override method visuales(){
				game.ground("concreto.png")
				// Muros
				muro.cargar("muro.png") 
				// Puerta
				game.addVisualIn(new Puerta(nivelActual = self),game.at(19,8)) //posicion siempre menor o igual a (height - 2) (width - 2) 
				tablero.cargarCofresDelNivel1()
				}	
				method comienzo(){
				
				game.start()}
				
}

object nivel2 inherits Nivel {
	// Leo no rompas nada 


	override method tipo() = 2
	override method start(){
	game.clear()
	super()
	
	game.start()
	}
override method visuales(){
		game.ground("suelo2.jpg")
		muro.cargar("muro2.jpg")
	}

}

object nivel3 inherits Nivel {


	override method tipo() = 3	
}




