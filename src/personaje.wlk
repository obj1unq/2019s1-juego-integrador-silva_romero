import wollok.game.*
import direcciones.* // USABLE PARA ASIGNAR A OTROS METODOS

object personaje {
// NOTAS :
// Hacer que el personaje no puede moverse o pisar los muros	
	
	
	var property vida = 1000	
	var property ataque = 300
	var property position = game.at(2,2)
	var property llavesObtenidas = 0
	var property inventario = [] // aqui va solo un item tipo arma
	var orientacion = derecha
	
	
	method image()= "jack2.png" // imagen provisoria
	
	method move(newMove) = self.position(newMove)
	
	
//	METODOS PARA MOVER AL PERSONAJE Y PARA SABER HACIA QUE LADO MIRA Y VOLVER 

	method irArriba() {
		orientacion = arriba
		self.avanzar()
	}

	method irAbajo() {
		orientacion = abajo
		self.avanzar()
	}

	method irIzquierda() {
		orientacion = izquierda
		self.avanzar()
	}

	method irDerecha() {
		orientacion = derecha
		self.avanzar()
	}
	
	method avanzar() {
		position = orientacion.avanzarHacia(position)
	}
	
	method retroceder() {
		position = orientacion.opuesto().avanzarHacia(position)
	}
	
	
// METODOS PARA LEVANTAR LAS ARMAS	
	method usarArma(){
		const colision = game.colliders(self)
		if (colision.isEmpty()){
			throw new Exception ("No hay armas")
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
			game.addVisualIn(inventario.head(),self.position())
			self.quitarMejora(inventario.head())
			inventario.remove(inventario.head())
			inventario.add(arma)
			game.removeVisual(arma)
			self.aplicarMejora(arma)
		}
	}
	
	method aplicarMejora(arma) {
		ataque += arma.mejoraAtk()
	}
	
	method quitarMejora(arma) {
		ataque -= arma.mejoraAtk()
	}
	
	
	
// METODO PARA LLAVES Y POSIONES
	method aplicarEfecto(item){ 
		if (item.tipo() == "frasco"){
			vida += item.efecto()
		}else{
			llavesObtenidas ++
		}
	}
	
	
	
	
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


	
}
