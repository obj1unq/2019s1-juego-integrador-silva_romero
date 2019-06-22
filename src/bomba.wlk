import otros_obj.*
import wollok.game.*
import personaje.*
import direcciones.*
class Bomba inherits NoColisionable {
	var property imagenes = ["bomba2.png","bomba3.png",
					"bomba4.png", "bomba5.png",
					"bomba6.png", "bomba7.png",
					"bomba8.png", "bomba9.png"]
	
	var property image = "bomba1.png"
	var position 
	method position() = position
	
		method explotar() {
	
		
		game.onTick(300,"explotar",{self.explotarbomba()})
		self.eliminarAlrededor()
		}
		
		
		method eliminarAlrededor(){
			self.aContinuacion(derecha)
			self.aContinuacion(izquierda)
			self.aContinuacion(abajo)
			self.aContinuacion(arriba)
		}
		method aContinuacion(direccion){
		if (self.personajeEnDireccion(direccion))	
					personaje.muerto()
		}	
		method personajeEnDireccion(direccion)= not game.getObjectsIn(direccion.posicionAl(self)).isEmpty() and 
												game.getObjectsIn(direccion.posicionAl(self)).contains(personaje)
		 
		method explotarbomba(){
			 				
							if (imagenes.isEmpty())
							{	game.removeTickEvent("explotar")
								game.removeVisual(self)	
												
							}	else{
					self.image(imagenes.first())
					imagenes.remove(imagenes.first())
					}
					}
	}
	//