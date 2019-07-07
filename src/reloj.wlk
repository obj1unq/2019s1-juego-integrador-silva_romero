import wollok.game.*
import resultado.*
import otros_obj.*
object reloj {
    var property nivelActual
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
		decenaDeSegundo.preparar(nro)
		segundo.preparar(nro2)
		game.onTick(1000, "actualiza cada segundo", { self.temporizador(sgds, sgd)})
	}

	method temporizador(nro, nro2) {
		if (self.termino()){
			game.removeTickEvent("actualiza cada segundo")
			nivelActual.perdiste()
			}else if (contador == 10) {
			self.temporizadorDecena(nro.anterior())
			self.temporizadorUnDigito(nro2.anterior())
			} else {
			self.temporizadorUnDigito(nro2.anterior())
			}
	}
		method temporizadorDecena(nro){
			decenaDeSegundo.numero(nro)
			sgds = nro
			contador = 0
		}
		method temporizadorUnDigito(nro) {
		segundo.numero(nro)
		sgd = nro
		contador += 1
	}
	
	method termino()= decenaDeSegundo.seAcabo() and segundo.seAcabo()	
	method reiniciar() {contador = 10	}

	

}
class Tiempo{
	var property numero 	
			method preparar(nro) {
			self.numero(nro)
			game.addVisual(self)
	}
	method image() = numero.image()
	method seAcabo() = numero.tipo() == 0
	
}
object decenaDeSegundo inherits Tiempo {
	var position = game.at(1, 12)
}

object segundo inherits Tiempo {
	var position = game.at(2, 12)

//override	method seAcabo() = decenaDeSegundo.seAcabo()and super()

}


