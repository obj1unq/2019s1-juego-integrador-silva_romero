import wollok.game.*
object reloj {
	method posicionar(){
		game.addVisualIn(cero,game.at(14,1))
		game.addVisualIn(nueve,game.at(14,2))
	}
	method probar(){
	// probar 10 
	game.onTick(1000,"actualiza el reloj cada 10 segundos", {self.contador()})
	 game.removeTickEvent("actualiza el reloj cada 10 segundos")
	}
	method segundo(){
	game.addVisualIn(cero.contador().image(),game.at(14,2))
	}
	method segundos(){
	game.addVisualIn(uno.anterior().image(),game.at(14,2))
	}
////
}
class Numeros{
	method image()
	method anterior() 
	method tipo()
	method segundoAlLado() = game.getObjectsIn(game.at(14,1))and game.getObjectsIn(game.at(14,1)).tipo() > 0
	method contador() = if (self.segundoAlLado())
								self.anterior()
								else cero
	}

object cero inherits Numeros {
	override method image() = "cero.png"
	override method anterior() = nueve
	override method tipo() = 0
}
object uno inherits Numeros {
override method image() = "uno.png"
override method anterior() = cero 
override method tipo() =1
}
object dos inherits Numeros {
	override method image() = "dos.png"
	override method anterior()= uno 
override method tipo() = 2
}
object tres inherits Numeros {
	override method image() = "tres.png"
	override method anterior() = dos
	override method tipo() = 3
}
object cuatro inherits Numeros {
	override method image() = "cuatro.png"
	override method anterior() =tres
	override method tipo() =4
}
object cinco inherits Numeros {
	override method image() = "cinco.png"
	override method anterior() = cuatro
	override method tipo() =5
}
object seis inherits Numeros {
	override method image() = "seis.png"
	override method anterior() = cinco
	override method tipo() =6
}
object siete inherits Numeros {
	override method image() = "siete.png"
	override method anterior() = seis
	override method tipo() =7
}
object ocho inherits Numeros {
	override method image() = "ocho.png"
	override method anterior() = siete
	override method tipo() =8
}
object nueve inherits Numeros {
	override method image() = "nueve.png"
	override method anterior() = ocho
	override method tipo() =9
}