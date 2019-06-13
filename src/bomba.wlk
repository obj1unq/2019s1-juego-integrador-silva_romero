import otros_obj.*

class Bomba inherits NoColisionable {
	var imagen = "bomba.png"
	var position 
	method image() = imagen
	method position() = position
	
	method explotar() {
		//cambia la imagen de la bomba y le hace 10 de daño al jugador si se encuentra a 2 casillas en cualquier direccion
		// (adyacentes o en diagonal).
		//El timer de este metodo ya esta hecho.
	}
}
