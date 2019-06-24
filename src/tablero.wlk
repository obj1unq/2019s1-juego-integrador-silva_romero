import wollok.game.*
import personaje.*
import otros_obj.*
import reloj.*
import factory.*

// OBJETO USADO PARA CREAR TODOS LOS COFRES QUE VAN A APARECER EN EL JUEGO
object tablero {
	
	// Aqui se asigna la cantidad de cofres que va a tener cada nivel y los cofres de armas y enemigos especificos por cada nivel.
	method cargarCofresDelNivel1() {
		// vida de enemigo: 6 a 12
		// nivel de  ataque del arma: 1 a 3
		
		const pos = game.at(1.randomUpTo(game.width() - 1).truncate(0), 1.randomUpTo(game.height() - 5).truncate(0))
		
		factoryCofre.imagenesArmas([ "martillo.png", "hoz.png", "arco1.png" ])
		
//		repeat.cant(3, { factoryCofre.crearCofreLlave(pos)}) // borrar esta linea solo es para testear el paso de nivel
		
		// DESCOMENTAR LO QUE ESTA ABAJO ES COMO QUEDA EL NIVEL 1
		
		//repeat.cant(4, { factoryCofre.crearCofreEnemigo(pos, 6, 12)})
		
		factoryCofre.crearCofreEnemigoConLlave(pos,6,12)
		
		//repeat.cant(2, { factoryCofre.crearCofreSalud(pos)})
	//	repeat.cant(3, { factoryCofre.crearCofreVeneno(pos)})
	
		
		repeat.cant(2, { factoryCofre.crearCofreLlave(pos)})
		
		repeat.cant(3, { factoryCofre.crearCofreArma(pos,1,3)})
		
		//repeat.cant(1, { factoryCofre.crearCofreBomba(pos)})
	}

	method cargarCofresDelNivel2() {
		// vida de enemigo: 8 a 15
		// nivel de  ataque del arma: 3 a 5
		
		factoryCofre.imagenesArmas([ "arma.png", "maso.png", "espada.png" ])
		const pos = game.at(1.randomUpTo(game.width() - 1).truncate(0), 1.randomUpTo(game.height() - 5).truncate(0))
		
//		repeat.cant(3, { factoryCofre.crearCofreLlave(pos)}) // borrar esta linea solo es para testear el paso de nivel
		
		// DESCOMENTAR LO QUE ESTA ABAJO ES COMO QUEDA EL NIVEL 2
		
		//repeat.cant(5, { factoryCofre.crearCofreEnemigo(pos, 8, 15)})
		
		repeat.cant(2, { factoryCofre.crearCofreEnemigoConLlave(pos,8,15)})
		
		//repeat.cant(2, { factoryCofre.crearCofreSalud(pos)})
		//repeat.cant(3, { factoryCofre.crearCofreVeneno(pos)})
		
		repeat.cant(1, { factoryCofre.crearCofreLlave(pos)})
		
		repeat.cant(3, { factoryCofre.crearCofreArma(pos,3,5)})
		
		//repeat.cant(2, { factoryCofre.crearCofreBomba(pos)})
	}

	method cargarCofresDelNivel3() {
		// vida de enemigo: 10 a 22
		// nivel de  ataque del arma: 6 a 8
		const pos = game.at(1.randomUpTo(game.width() - 1).truncate(0), 1.randomUpTo(game.height() - 5).truncate(0))
		factoryCofre.imagenesArmas(["palo3.png","Labrys.png","espada3.png"])
		
//		repeat.cant(3, { factoryCofre.crearCofreLlave(pos)}) // borrar esta linea solo es para testear el paso de nivel
		
		// DESCOMENTAR LO QUE ESTA ABAJO ES COMO QUEDA EL NIVEL 3
		
		//repeat.cant(6, { factoryCofre.crearCofreEnemigo(pos, 10, 22)})
		
		//repeat.cant(1, { factoryCofre.crearCofreSalud(pos)})
		//repeat.cant(2, { factoryCofre.crearCofreVeneno(pos)})
		
		repeat.cant(3,{factoryCofre.crearCofreEnemigoConLlave(pos,10,22)})
		
		repeat.cant(3, { factoryCofre.crearCofreArma(pos,6,8)})
		
		//repeat.cant(3, { factoryCofre.crearCofreBomba(pos)})
	}
	
}

