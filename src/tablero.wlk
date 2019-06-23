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
		var pos = game.at(1.randomUpTo(game.width() - 1).truncate(0), 1.randomUpTo(game.height() - 5).truncate(0))
		
		repeat.cant(4, { factoryCofre.crearCofreEnemigo(pos, 6, 12)})
		
		repeat.cant(2, { factoryCofre.crearCofrePocion(pos)})
		repeat.cant(2, { factoryCofre.crearCofreVeneno(pos)})
		
		repeat.cant(2, { factoryCofre.crearCofreLlave(pos)})
		
		repeat.cant(2, { factoryCofre.crearCofreArmaNivel1(pos)})
		
		repeat.cant(3, { factoryCofre.crearCofreBomba(pos)})
	}

	method cargarCofresDelNivel2() {
		// vida de enemigo: 8 a 15
		var pos = game.at(1.randomUpTo(game.width() - 1).truncate(0), 1.randomUpTo(game.height() - 5).truncate(0))
		
		repeat.cant(4, { factoryCofre.crearCofreEnemigo(pos, 8, 15)})
		
		repeat.cant(2, { factoryCofre.crearCofrePocion(pos)})
		repeat.cant(2, { factoryCofre.crearCofreVeneno(pos)})
		
		repeat.cant(2, { factoryCofre.crearCofreLlave(pos)})
		
		repeat.cant(2, { factoryCofre.crearCofreArmaNivel1(pos)})
		
		repeat.cant(3, { factoryCofre.crearCofreBomba(pos)})
	}

	method cargarCofresDelNivel3() {
		// vida de enemigo: 10 a 22
		var pos = game.at(1.randomUpTo(game.width() - 1).truncate(0), 1.randomUpTo(game.height() - 5).truncate(0))
		
		repeat.cant(4, { factoryCofre.crearCofreEnemigo(pos, 10, 22)})
		
		repeat.cant(2, { factoryCofre.crearCofrePocion(pos)})
		repeat.cant(2, { factoryCofre.crearCofreVeneno(pos)})
		
		repeat.cant(2, { factoryCofre.crearCofreLlave(pos)})
		
		repeat.cant(2, { factoryCofre.crearCofreArmaNivel1(pos)})
		
		repeat.cant(3, { factoryCofre.crearCofreBomba(pos)})
	}

}

