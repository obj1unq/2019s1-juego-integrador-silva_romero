import wollok.game.*
import personaje.*
import otros_obj.*
import reloj.*
import factory.*

// OBJETO USADO PARA CREAR TODOS LOS COFRES QUE VAN A APARECER EN EL JUEGO(GT)
object tablero {
	
	// Aqui se asigna la cantidad de cofres que va a tener cada nivel y los cofres de armas y enemigos especificos por cada nivel.(GT)
	method cargarCofresDelNivel1() {
		// vida de enemigo: 6 a 12
		// nivel de  ataque del arma: 1 a 3
		
		const pos = game.at(1.randomUpTo(game.width() - 1).truncate(0), 1.randomUpTo(game.height() - 5).truncate(0))
		
//		repeat.cant(3, { factoryCofre.crearCofreEnemigo(pos, 6, 12)})
//		repeat.cant(2, { factoryCofre.crearCofreSalud(pos)})
//		repeat.cant(2, { factoryCofre.crearCofreVeneno(pos)})
//		
		//repeat.cant(3, { factoryCofre.crearCofreLlave(pos)})// no se olviden de descomentar todos :)
//		factoryCofre.crearCofreEnemigoConLlave(pos,6,12)
		
//		repeat.cant(2, { factoryCofre.crearCofreArma(pos,1,3)})
		
		repeat.cant(3, { factoryCofre.crearCofreBomba(pos)})
	}

	method cargarCofresDelNivel2() {
		// vida de enemigo: 8 a 15
		// nivel de  ataque del arma: 2 a 4
		const pos = game.at(1.randomUpTo(game.width() - 1).truncate(0), 1.randomUpTo(game.height() - 5).truncate(0))
		
		repeat.cant(3, { factoryCofre.crearCofreEnemigo(pos, 8, 15)})

		repeat.cant(2, { factoryCofre.crearCofreSalud(pos)})
		repeat.cant(2, { factoryCofre.crearCofreVeneno(pos)})
		
		repeat.cant(1, { factoryCofre.crearCofreLlave(pos)})
		repeat.cant(2,{factoryCofre.crearCofreEnemigoConLlave(pos,10,22)})
		
		repeat.cant(2, { factoryCofre.crearCofreArma(pos,2,4)})
		
		repeat.cant(3, { factoryCofre.crearCofreBomba(pos)})
	}

	method cargarCofresDelNivel3() {
		// vida de enemigo: 10 a 22
		// nivel de  ataque del arma: 3 a 6
		const pos = game.at(1.randomUpTo(game.width() - 1).truncate(0), 1.randomUpTo(game.height() - 5).truncate(0))
		
		repeat.cant(3, { factoryCofre.crearCofreEnemigo(pos, 10, 22)})
		
		
		repeat.cant(2, { factoryCofre.crearCofreSalud(pos)})
		repeat.cant(2, { factoryCofre.crearCofreVeneno(pos)})
		
		//repeat.cant(2, { factoryCofre.crearCofreLlave(pos)})
		repeat.cant(3,{factoryCofre.crearCofreEnemigoConLlave(pos,10,22)})
		
		repeat.cant(2, { factoryCofre.crearCofreArma(pos,3,6)})
		
		repeat.cant(3, { factoryCofre.crearCofreBomba(pos)})
	}
	
//	method limpiar() {
//		//Quita todos los elementos del area de juego que no sean pikachu ni puerta
//		NO SIRVE, MUY LENTO
//		
//		
//		(1 .. 14-6).forEach { y => 
//			(1 .. 22-1).forEach { x => self._limpiar(game.at(x,y))  
//
//			}
//		}
//		
//	}
//	
//	method _limpiar(pos) {
//		//implementacion parcial de limpiar()
//		
//		if( self.noEsPersonajeNiPuerta(pos) ) {
//			remove.allIn(pos)
//		}
//	}
//	
//	method noEsPersonajeNiPuerta(pos) {
//		return game.getObjectsIn(pos).all { obj => (not obj.tipo() == "personaje") && (not obj.tipo() == "puerta")  }
//	}

}

