import otros_obj.*
import wollok.game.*
class Bomba inherits NoColisionable {
	var imagenes = ["bomba2.png","bomba3.png",
					"bomba4.png", "bomba5.png",
					"bomba6.png", "bomba7.png",
					"bomba8.png", "bomba9.png"]
	
	var property imagen = "bomba1.png"
	var position 
	method image() = imagen
	method position() = position
	
	method explotar() {
		//cambia la imagen de la bomba y le hace 10 de daño al jugador si se encuentra a 2 casillas en cualquier direccion
		// (adyacentes o en diagonal).
		//El timer de este metodo ya esta hecho.
		
		game.onTick(500,"explotar",{self.explotarbomba()})
	
		}
		method explotarbomba(){
							if (imagenes.size()== 0 )
							{game.removeTickEvent("explotar")
							game.removeVisual(self)}
									else
							self.imagen(imagenes.first())
							imagenes.remove(imagenes.first())	
	}
}