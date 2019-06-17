import otros_obj.*
import wollok.game.*
import personaje.*
import direcciones.*
//class Bomba inherits NoColisionable {
//	var imagenes = ["bomba2.png","bomba3.png",
//					"bomba4.png", "bomba5.png",
//					"bomba6.png", "bomba7.png",
//					"bomba8.png", "bomba9.png"]
//	
//	var property image = "bomba1.png"
//	var property position 
//	method position() = position
//	
//	method explotar() {
//		//cambia la imagen de la bomba y le hace 10 de daño al jugador si se encuentra a 2 casillas en cualquier direccion
//		// (adyacentes o en diagonal).
//		//El timer de este metodo ya esta hecho.
//		
//		//game.onTick(300,"explotar",{self.explotarbomba()})
//	//	self.eliminarAlrededor()
//		}
//		
//		method eliminarAlrededor(){
//			self.aContinuacion(derecha)
//			self.aContinuacion(izquierda)
//			self.aContinuacion(abajo)
//			self.aContinuacion(arriba)
//		}
//		method aContinuacion(direccion){
//		if (self.personajeEnDireccion(direccion))	
//					personaje.muerto()
//		}	
//		method personajeEnDireccion(direccion)= not game.getObjectsIn(direccion.posicionAl(self)).isEmpty() and 
//												game.getObjectsIn(direccion.posicionAl(self)).contains(personaje)
//		 
//		method explotarbomba(){
////							if (imagenes.size()== 0)
////							{game.removeTickEvent("explotar")
////							game.removeVisual(self)}
////									else
////							self.image(imagenes.first())
////							imagenes.remove(imagenes.first())	
//	}
//}