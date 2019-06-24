import wollok.game.*
import resultado.*
import otros_obj.*
object reloj {

	var sgds
	var sgd
	var contador = 10

	// el reloj funciona con decenas por el contador 
	method preparar(nro, obj) {
		obj.cant(nro)
		game.addVisual(obj)
	}

	method definir(nro, nro2) {
		sgds = nro
		sgd = nro2
	}

	method funcionando(nro, nro2) {
		self.definir(nro, nro2)
		self.preparar(nro2, segundo)
		self.preparar(nro, segundos)
		// game.onTick(10000,"actualiza la centena de segundo",{self.posicionar(sgds,segundos,"actualiza la centena de segundo")})
		game.onTick(1000, "actualiza cada segundo", { self.temporizador(sgds, sgd)})
	}


	method temporizador(nro, nro2) {
		if (self.termino()) 
			{game.removeTickEvent("actualiza cada segundo")
			game.clear()
			game.addVisualIn(gameOver,game.origin())
			control.reiniciar()
			}
			else if (contador == 10) {
			segundos.cant(nro.anterior())
			sgds = nro.anterior()
			contador = 0
			self.temporizadorUnDigito(nro2)
		} else {
			self.temporizadorUnDigito(nro2)
		}
	}
	method termino()=segundos.seAcabo() and segundo.esCero()
	method reiniciar() {
		contador = 10
	}

	method temporizadorUnDigito(nro) {
		segundo.cant(nro.anterior())
		sgd = nro.anterior()
		contador += 1
	}

}

object segundos {

	var property cant
	var position = game.at(7, 12)

	method image() = cant.image()

	method seAcabo() = cant.tipo() == 0

}

object segundo {

	var property cant
	var position = game.at(8, 12)

	method image() = cant.image()

	method esCero() = cant.tipo() == 0

	method seAcabo() = segundos.seAcabo() and self.esCero()

}

class Numeros {

	method image()

	method anterior()

	method tipo()

}

object cero inherits Numeros {

	override method image() = "cero.png"

	override method anterior() = nueve

	override method tipo() = 0

}

object uno inherits Numeros {

	override method image() = "uno.png"

	override method anterior() = cero

	override method tipo() = 1

}

object dos inherits Numeros {

	override method image() = "dos.png"

	override method anterior() = uno

	override method tipo() = 2

}

object tres inherits Numeros {

	override method image() = "tres.png"

	override method anterior() = dos

	override method tipo() = 3

}

object cuatro inherits Numeros {

	override method image() = "cuatro.png"

	override method anterior() = tres

	override method tipo() = 4

}

object cinco inherits Numeros {

	override method image() = "cinco.png"

	override method anterior() = cuatro

	override method tipo() = 5

}

object seis inherits Numeros {

	override method image() = "seis.png"

	override method anterior() = cinco

	override method tipo() = 6

}

object siete inherits Numeros {

	override method image() = "siete.png"

	override method anterior() = seis

	override method tipo() = 7

}

object ocho inherits Numeros {

	override method image() = "ocho.png"

	override method anterior() = siete

	override method tipo() = 8

}

object nueve inherits Numeros {

	override method image() = "nueve.png"

	override method anterior() = ocho

	override method tipo() = 9

}

