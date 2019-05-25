import wollok.game.*

object personaje {
var property energia = 5	
var property position = game.at(3,3)
	
	method image(){return "cofre1.jpg"
		
	}
	method move(nuevaPosicion) {
		energia -= 1
	self.position(nuevaPosicion)
	}
	
	//method abrirCofre(cofre){
		//cofre.objeto() 
//	}
//
//}
//class Cofre{
//	const property objeto
//	
		//method image() = "cofre1"
//		method mensajeDeObjeto(){
//			objeto.efecto()
//}
	
}
