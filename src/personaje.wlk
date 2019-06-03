import wollok.game.*

object personaje {
// NOTAS :
// Hacer que el personaje no puede moverse o pisar los muros	
	
	
	var property vida = 1000	
	var property ataque = 300
	var property position = game.at(2,2)
	const llavesObtenidas = []
	
	
	method image()= "jack.png" // imagen provisoria
	
	method move(newMove) = self.position(newMove)
	
	
	// Metodo optativo para 
	method interactuar(){
		const objetos = game.colliders(self) // esta es una lista en la cual cuando el personaje colisiona con un objeto se guarda aqui.
		
		if (objetos.isEmpty()){
			throw new Exception ("No hay nada para interactuar")
		}else{
			// APLICAR LOS METODOS PARA QUE AL ENCONTRAR LOS POTENCIADORES ESTE LOS USE
			// LO MISMO PARA LOS ENEMIGOS?
		}
		
	}
	
	
	/* 
	method abrirCofre(cofre){ 
		cofre.objeto() 
	}*/


	
}
