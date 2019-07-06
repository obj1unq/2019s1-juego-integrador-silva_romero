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
			resultado.perdiste()
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
	var position = game.at(1, 12)

	method image() = cant.image()

	method seAcabo() = cant.tipo() == 0

}

object segundo {

	var property cant
	var position = game.at(2, 12)

	method image() = cant.image()

	method esCero() = cant.tipo() == 0

	method seAcabo() = segundos.seAcabo() and self.esCero()

}


