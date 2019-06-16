import wollok.game.*
object reloj {
	
	// reloj de cinco minutos 
	
	method posicionar(){
		game.addVisual(minuto)
		game.addVisual(segundos)
		game.addVisual(segundo)
	}
	
	
	
	
	method update() {}
}







object minuto {
	var imagenes = ["cuatro.png","tres.png","dos.png","uno.png","cero.png"]
	var  position = game.at(1,13)
	var property image = "cinco.png" 
	
	method cuentaRegresiva(){
		if (not imagenes.isEmpty())
		self.image(imagenes.first())
		imagenes.remove(imagenes.first())
		} 	
	method terminaron() = image == "cero.png"
}
object segundos {
	
	var imagenes = ["cinco.png","cuatro.png","tres.png","dos.png","uno.png","cero.png"]
	var image = "cero.png"
	var position = game.at(2,13)
	method cuentaRegresiva(){
		image = imagenes.first()
		imagenes.add(image)
		imagenes.remove(imagenes.first())
	}			
		
}
object segundo{
	var imagenes = ["nueve.png","cero.png","uno.png","dos.png","tres.png",
					"cuatro.png","cinco.png","seis.png","siete.png",
					"ocho.png"]
	var image = "cero.png"
	var position = game.at(3,13)
	method cuentaRegresiva(){
		image = imagenes.first()
		imagenes.add(image)
		imagenes.remove(imagenes.first())
	}
}
