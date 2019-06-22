//A partir de la info de aca se construyen los niveles.
//Si usamos algun factory, ponerlo aca.
import wollok.game.*
import otros_obj.*
import menu.* 
import reloj.* 
import obstaculos.*
import puerta.*
import bomba.*
import direcciones.*
import personaje.*

import cofre.*

import frasco.*
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
			game.title("Keanu Reeves")
			game.height(14)
			game.width(22)
		}
		method personaje(){
		// Personaje
	 	game.addVisual(personaje)
		// Colisiones 
		game.whenCollideDo(personaje,{objeto => objeto.colisionarCon(personaje)})
		//Los unicos obj. con los que puede colisionar son llaves o frascos.	
		}		 
		method movimientos() {
		keyboard.up().onPressDo{ personaje.mover(personaje.position().up(1), arriba)}
		keyboard.down().onPressDo{ personaje.mover(personaje.position().down(1), abajo)}
		keyboard.left().onPressDo{ personaje.mover(personaje.position().left(1), izquierda)}
		keyboard.right().onPressDo{ personaje.mover(personaje.position().right(1), derecha)}
		keyboard.e().onPressDo{ personaje.ataqueA()}
		keyboard.space().onPressDo{ personaje.interactuar()}
		keyboard.a().onPressDo{ game.say(personaje, personaje.ataque().toString())} // Para testings
		keyboard.v().onPressDo{ game.say(personaje, personaje.vida().toString())} // Para testings
		keyboard.l().onPressDo{ game.say(personaje, personaje.llavesObtenidas().toString())} // Para testings
		keyboard.o().onPressDo{ game.say(personaje, personaje.position().up(1).allElements().toString())}
		keyboard.r().onPressDo{ self.reiniciar()}
	}
		method menu() {
		game.addVisualIn(convertirNumero.obtenerNumero(personaje.ataque()),game.at(5,11))
		representacionMenu.cargarCorazones()
		representacionMenu.actualizarVida()
		keyboard.any().onPressDo{ representacionMenu.actualizar()}
		reloj.funcionando(nueve,cero)
	}
		method animaciones(){
		game.onTick(1000,"animacion enemigos", {observerEnemigos.update()} ) //<??> Si pongo esto sin un bloque, tira error del metodo (un bug?) -> Es asi como se escribe el onTick(GT)
		}
		method visuales(){} // cada nivel maneja su propio visuales / fondo, enemigos, cofres
		/// 
		
		
		method ganaste(){}	// cada nivel maneja su propio ganaste 
		 
		method reiniciar(){
			game.clear()
			self.start()
		}
		method perdiste(){}
}


object nivel1 inherits Nivel {
	var cantCofres = 16 //falta decidir cuantos, no es definitivo
	var armasPosibles = []
		
	var rangoHpEnemigosMin = 4
	var rangoHpEnemigosMax = 12
override method tipo() = 1
override method ganaste() {nivel2.start()}
override method start() {
				super()
				self.comienzo() // sin el nivel 1 no hay comienzo 
					}
override method visuales(){
				game.ground("concreto.png")
				// Muros
				muro.cargar() 
				// Puerta
				game.addVisualIn(new Puerta(nivelActual = self),game.at(19,8)) //posicion siempre menor o igual a (height - 2) (width - 2) 
				tablero.cargarCofres()
				}	
				method comienzo(){
				game.start()
				}
}

object nivel2 inherits Nivel {
	
	var cantCofres = 22 
	var armasPosibles = []
	
	var rangoHpEnemigosMin = 6
	var rangoHpEnemigosMax = 15
	override method tipo() = 2
	override method start(){
	game.clear()
	game.ground("cinco.png")
	game.start()
	}
}

object nivel3 inherits Nivel {
	var ancho = 28
	var cantCofres = 28 
	var armasPosibles = []
	
	var rangoHpEnemigosMin = 8
	var rangoHpEnemigosMax = 22
	override method tipo() = 3	
}




