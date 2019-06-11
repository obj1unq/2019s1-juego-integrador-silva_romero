import wollok.game.*
import direcciones.* // USABLE PARA ASIGNAR A OTROS METODOS

object personaje {
	var property vida = 1000	
	var property ataque = 300
	
	//El ataque podria ser un method ataque() sin necesidad de usar variables. Se puede hacer de manera poscalculada <!!>

	var property llavesObtenidas = 0
	var property inventario = [] // Contiene solo un item de tipo arma

	var orientacion = derecha
	var property position = game.at(2,2)
	var imagen = orientacion.imagenDelPersonaje()
	
	method image()= imagen 
	
	method llevadoPor(personaje){
		// Respeta el polimorfismo.
		// Por algun motivo hay que ponerlo aca tambien para que no de error.(GT)
	}
	method ataqueA() {
	//Ataque solo funciona con un enemigo en orientacion 
		self.enemigo().reciboAtaque(self)
	}
	method esAtacado(ataqueEnemigo){
		vida -= ataqueEnemigo
	}
	
	method enemigo() = game.getObjectsIn(orientacion.posicionAl(self))

///----------------------------------------------------------
///---------------------- MOVIMIENTO ------------------------
///----------------------------------------------------------

	method actualizarImagen() {
		//Ejecuta cada vez que se intenta mover
		imagen = orientacion.imagenDelPersonaje()
		game.addVisual(self)
	}
	
	method puedeMoverAl(dir) {
		//Puede mover si no hay ningun obj en direccion dir o si el obj es colisionable
		//Todos los obj entienden el mensaje esColisionable(). ver otros_obj.wlk
		return game.getObjectsIn(dir.posicionAl(self)).isEmpty() or 
			game.getObjectsIn(dir.posicionAl(self)).all { obj => obj.esColisionable() }
		
		// game.colliders(self) sirve para obj que colisionen en misma posicion. Para comprobar en una direccion
		// se usa game.getObjectsIn(posicion)
	}
	
	method mover(nuevaPosicion, dir) {
		//Puede mover si no hay un obj no colisionable en direccion dir
		
		orientacion = dir //Actualiza la variable del personaje
		self.actualizarImagen()
		if (self.puedeMoverAl(dir)) {
			self.position(nuevaPosicion)
		} else {}
	}
	
///----------------------------------------------------------
///----------------------------------------------------------

// Pociones

method aplicarEfecto(frasco) {
	//Ejecuta cuando el frasco le envia este mensaje. El frasco se lo envia cuando es colisionado
	vida += frasco.efecto()
}

// Llaves

method recogerLlave() { // USARLO DENTRO DE UN METODO MAS GENERAL.(GT)
	//Ejecuta cuando la llave le envia este mensaje. La llave se lo envia cuando es colisionada.
	llavesObtenidas ++
}

	
// METODOS PARA LEVANTAR LAS ARMAS	

	method llevarArma(arma){
		if(inventario.isEmpty()){
			inventario.add(arma)
			game.removeVisual(arma)
			self.aplicarMejora(arma)
		}else{
			self.tirarArmaActual()				
			inventario.add(arma)
			game.removeVisual(arma)
			self.aplicarMejora(arma)
		}
	}
	
	method tirarArmaActual(){
			game.addVisualIn(inventario.head(),orientacion.posicionAl(self)) 
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
		//Ejecuta al apretar un boton.
		//Envia mensaje serInteractuadoPor(self) al objeto que tenga segun la orientacion
		//Si es enemigo, lo ataca. Si es cofre, lo abre. Si es puerta, intenta abrirla.
		//AHORA SE USA PARA ARMAS. (GT)
		
		//Si es muro, un frasco, llave (EN DIRECCION DE LA ORIENTACION) no deberia pasar nada
		
		if (not game.getObjectsIn(orientacion.posicionAl(self)).isEmpty()) {
			game.getObjectsIn(orientacion.posicionAl(self)).all { obj => obj.serInteractuadoPor(self) }
		} else {
			game.say(self,"No hay nada para interactuar ):")
		}
	}


}
