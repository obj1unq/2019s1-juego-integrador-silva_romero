import wollok.game.*

object personaje {
// NOTAS :
// Hacer que el personaje no puede moverse o pisar los muros	
	
	
	var property vida = 1000	
	var property ataque = 300
	var property position = game.at(2,2)
	var property llavesObtenidas = 0
	var property itemActual = [] // aqui va solo un item tipo arma
	
	method image()= "jack2.png" // imagen provisoria
	
	method move(newMove) = self.position(newMove)
	
	method usarArma(){
		const colision = game.colliders(self)
		if (colision.isEmpty()){
			throw new Exception ("No hay armas")
		}else{
			self.aniadirArma(colision.head())
		}
	}
	
	method aniadirArma(arma){
		if(itemActual.isEmpty()){
			itemActual.add(arma)
			game.removeVisual(arma)
			self.aplicarMejora(arma)
		}else{
			game.addVisualIn(itemActual.head(),self.position())
			self.quitarMejora(itemActual.head())
			itemActual.remove(itemActual.head())
			itemActual.add(arma)
			game.removeVisual(arma)
			self.aplicarMejora(arma)
		}
	}
	
	
	
	method aplicarEfecto(item){ // Solo para posiones y llaves.
		if (item.tipo() == "frasco"){
			vida += item.efecto()
		}else{
			llavesObtenidas ++
		}
	}
	
	method aplicarMejora(arma) {
		ataque += arma.mejoraAtk()
	}
	
	method quitarMejora(arma) {
		ataque -= arma.mejoraAtk()
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
