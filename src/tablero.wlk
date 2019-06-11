import wollok.game.*
import personaje.*
import otros_obj.*

//El obj muro se movio al archivo obstaculos
//Este archivo quedo obsoleto <!!>


//object tesoro {
//	<!!> no corresponde que este dentro del archivo tablero
// Corresponde que exista una clase Cofre y a partir de esa clase se instancien cofres en Escape.wpgm
//	method image()= "cofre1.jpg"
//	
//	method cargar(){
//		var tesoros = []
//		
//		tesoros.addAll([new Position(3,12), new Position(6,12), new Position(12,12)])
//		
//		tesoros.forEach {direccion => game.addVisualIn(self,direccion)}
//	}
//	
//	method esLlevadoPor(personaje){
//		// no hace nada respeta el poliformismo
//	}
//}