

class Direccion {
	
	method avanzarHacia(position)
}

object izquierda inherits Direccion { 
	
	override method avanzarHacia(position) = position.left(1) 
	method image() = "pikachuIzq.png"
	method opuesto() = derecha
}

object derecha inherits Direccion { 
	
	override method avanzarHacia(position) = position.right(1) 
	method image()= "pikachuDer.png"
	method opuesto() = izquierda
}

object abajo inherits Direccion { 
	
	override method avanzarHacia(position) = position.down(1) 
	method image()= "pikachuFrente.png"
	method opuesto() = arriba
}

object arriba inherits Direccion { 
	
	override method avanzarHacia(position) = position.up(1) 
	method image()="pikachuEspalda.png"
	method opuesto() = abajo
}