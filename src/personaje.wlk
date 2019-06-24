import wollok.game.*
import direcciones.*
import menu.*
import llave.*
import resultado.*

//
object personaje {

	var property vida = 10
	var property ataque = 1
	var property llavesObtenidas = []
	var property inventario = [] // Contiene solo un tipo arma
	var orientacion = derecha
	var property position = game.at(2, 2)
	var imagen = orientacion.imagenDelPersonaje()

	method image() = imagen

	method tipo() = "personaje"

	method colisionarCon(personaje) {
	// Respeta el polimorfismo.
	}

	method ataqueA() {
		// Ataque solo funciona con un enemigo en orientacion 
		self.enemigo().reciboAtaque(self)
	}

	method esAtacado(ataqueEnemigo) {
		imagen = orientacion.imagenDelPersonajeAtacado()
		vida -= ataqueEnemigo
		representacionMenu.actualizarVida()
	}

	method enemigo() = game.getObjectsIn(orientacion.posicionAl(self))

///----------------------------------------------------------
///---------------------- MOVIMIENTO ------------------------
///----------------------------------------------------------
	method actualizarImagen() {
		// Ejecuta cada vez que se intenta mover
		if (vida <= 0) {
			self.muerto()
		} else imagen = orientacion.imagenDelPersonaje()
		game.addVisual(self)
	}

	method puedeMoverAl(dir) {
		// Puede mover si no hay ningun obj en direccion dir o si el obj es colisionable
		// Todos los obj entienden el mensaje esColisionable()
		return game.getObjectsIn(dir.posicionAl(self)).isEmpty() or game.getObjectsIn(dir.posicionAl(self)).all{ obj => obj.esColisionable() }
	}

	method mover(nuevaPosicion, dir) {
		// Puede mover si no hay un obj no colisionable en direccion dir
		orientacion = dir // Actualiza la variable del personaje
		self.actualizarImagen()
		if (vida > 0 && self.puedeMoverAl(dir)) {
			self.position(nuevaPosicion)
		}
	}

///----------------------------------------------------------
///----------------------------------------------------------
// Frascos
	method aplicarEfecto(frasco) {
		vida += frasco.efecto()
		vida = 10.min(vida)
			// /para que la representacion en el menu se ejecute justo despues de agarrar un frasco
		representacionMenu.actualizarVida()
	}

// Llaves
	method recogerLlave() {
		llavesObtenidas.add(new Llave())
	}

// METODOS LAS ARMAS	
	method llevarArma(arma) {
		if (inventario.isEmpty()) {
			inventario.add(arma)
			game.removeVisual(arma)
			self.aplicarMejora(arma)
			game.addVisualIn(arma, game.at(10, 12)) // agrega la imagen al menu
		} else {
			self.tirarArmaActual()
			inventario.add(arma)
			game.removeVisual(arma)
			game.addVisualIn(arma, game.at(10, 12)) // agrega la imagen al menu 
			self.aplicarMejora(arma)
		}
	}

	method tirarArmaActual() {
		game.removeVisual(inventario.head()) // elimina la imagen del menu 
		game.addVisualIn(inventario.head(), orientacion.posicionAl(self))
		self.quitarMejora(inventario.head())
		inventario.remove(inventario.head())
	}

	method aplicarMejora(arma) {
		ataque += arma.mejoraAtk()
	}

	method quitarMejora(arma) {
		ataque -= arma.mejoraAtk()
	}

///----------------------------------------------------------
///---------------------------- 	INTERACTUAR -------------
///----------------------------------------------------------
	method interactuar() {
		// Envia mensaje serInteractuadoPor(self) al objeto que tenga segun la orientacion
		// Si es enemigo, lo ataca. Si es cofre, lo abre. Si es puerta, intenta abrirla.
		// Si es muro, un frasco, llave (EN DIRECCION DE LA ORIENTACION) no pasa nada
		if (not game.getObjectsIn(orientacion.posicionAl(self)).isEmpty()) {
			game.getObjectsIn(orientacion.posicionAl(self)).all{ obj => obj.serInteractuadoPor(self)}
		} else {
			//game.say(self, "No hay nada para interactuar ):")
		}
	}

// Metodo cuando el personaje abre un cofre bomba
	method explotado() {
		if (self.vida() > 0) {
			vida -= 4
		} else {
			self.muerto()
		}
	}

	method muerto() {
		vida = 0
		imagen = "pikachuMuerto.png"
	}

// Pasar de Nivel 
	method pasoDeNivel() {
		llavesObtenidas = []
		inventario = []
	}

// reiniciar
	method reiniciar() {
		vida = 10
		imagen = orientacion.imagenDelPersonaje()
		ataque = 1
		llavesObtenidas = []
		inventario = []
	}

}

