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

method recogerLlave() {
	//Ejecuta cuando la llave le envia este mensaje. La llave se lo envia cuando es colisionada
	llavesObtenidas ++
}

	
// METODOS PARA LEVANTAR LAS ARMAS	
//Deberia enviarle mensajes al arma, no quedarse con todos los metodos el personaje <!!>
	method llevarArma(){
		const colision = game.colliders(self)
		if (colision.isEmpty()){
			game.say(self,"No hay armas")
		}else{
			self.aniadirArma(colision.head())
		}
	}
	
	method aniadirArma(arma){
		if(inventario.isEmpty()){
			inventario.add(arma)
			game.removeVisual(arma)
			self.aplicarMejora(arma)
		}else{
			game.addVisualIn(inventario.head(),self.position()) ///esto puede ir en otro metodo y hacer mas legible 
			self.quitarMejora(inventario.head())				//			
			inventario.remove(inventario.head())				//
			inventario.add(arma)
			game.removeVisual(arma)
			self.aplicarMejora(arma)
		}
	}
	
	method tirarArmaActual(){game.addVisualIn(inventario.head(),self.position()) // Metodo que se encarga de tirar el arma 
							self.quitarMejora(inventario.head())
							inventario.remove(inventario.head())}
	
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
		//deberia comprobar el arma que esta en el piso (OJO, NO EN LA ORIENTACION), por ahora de eso se encarga el boton e
		
		//Si es muro, un frasco, llave o arma (EN DIRECCION DE LA ORIENTACION) no deberia pasar nada
		
		if (not game.getObjectsIn(orientacion.posicionAl(self)).isEmpty()) {
			game.getObjectsIn(orientacion.posicionAl(self)).all { obj => obj.serInteractuadoPor(self) }
		} else {
			game.say(self,"No hay nada para interactuar ):")
		}
	}

///----------------------------------------------------------
///----------------------------------------------------------


// OBSOLETO
	
//// METODO PARA LLAVES Y POCIONES
//	method aplicarEfecto(item){ 
//		if (item.tipo() == "frasco"){
//			vida += item.efecto()
//		}else{
//			llavesObtenidas ++
//		}
//	}
//	
	
	// Metodo  para enemigos, cambiar interactuar por atacar?
//	method interactuar(){
	//	const objetos = game.colliders(self) // esta es una lista en la cual cuando el personaje colisiona con un objeto se guarda aqui.
		
		//if (objetos.isEmpty()){
		//	throw new Exception ("No hay nada para interactuar")
		//}else{}
		//}

	
	
	/* 
	method abrirCofre(cofre){ 
		cofre.objeto() 
	}*/


	//	METODOS PARA MOVER AL PERSONAJE Y PARA SABER HACIA QUE LADO MIRA Y VOLVER 
//	method move(newMove) = self.position(newMove)

//	method irArriba() {
//		orientacion = arriba
//		self.avanzar()
//	}
//
//	method irAbajo() {
//		orientacion = abajo
//		self.avanzar()
//	}
//
//	method irIzquierda() {
//		orientacion = izquierda
//		self.avanzar()
//	}
//
//	method irDerecha() {
//		orientacion = derecha
//		self.avanzar()
//	}
//	
//	method avanzar() {
//		position = orientacion.avanzarHacia(position)
//	}
	
//	method retroceder() {
//		//Obsoleto
//		position = orientacion.opuesto().avanzarHacia(position)
//	}
}
