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
		factoryCofre.imagenesArmas([ "martillo.png", "hoz.png", "arco1.png" ])
		const pos = game.at(1.randomUpTo(game.width() - 1).truncate(0), 1.randomUpTo(game.height() - 5).truncate(0))
		repeat.cant(4, { factoryCofre.crearCofreEnemigo(pos, 6, 12)})
		factoryCofre.crearCofreEnemigoConLlave(pos, 6, 12)
		repeat.cant(2, { factoryCofre.crearCofreSalud(pos)})
		repeat.cant(3, { factoryCofre.crearCofreVeneno(pos)})
		repeat.cant(2, { factoryCofre.crearCofreLlave(pos)})
		repeat.cant(3, { factoryCofre.crearCofreArma(pos, 1, 3)})
		//repeat.cant(3, { factoryCofre.crearCofreBomba(pos)})
	}

	method cargarCofresDelNivel2() {
		// vida de enemigo: 8 a 15
		// nivel de  ataque del arma: 2 a 4
		const pos = game.at(1.randomUpTo(game.width() - 1).truncate(0), 1.randomUpTo(game.height() - 5).truncate(0))
		factoryCofre.imagenesArmas(["arco.png","arma.png","maso.png"])
		repeat.cant(5, { factoryCofre.crearCofreEnemigo(pos, 8, 15)})
		
		repeat.cant(2, { factoryCofre.crearCofreEnemigoConLlave(pos,8,15)})
		
		repeat.cant(2, { factoryCofre.crearCofreSalud(pos)})
		repeat.cant(3, { factoryCofre.crearCofreVeneno(pos)})
		
		repeat.cant(1, { factoryCofre.crearCofreLlave(pos)})
		
		repeat.cant(3, { factoryCofre.crearCofreArma(pos,2,4)})
		
		repeat.cant(3, { factoryCofre.crearCofreBomba(pos)})
	}

	method cargarCofresDelNivel3() {
		// vida de enemigo: 10 a 22
		// nivel de  ataque del arma: 3 a 6
		const pos = game.at(1.randomUpTo(game.width() - 1).truncate(0), 1.randomUpTo(game.height() - 5).truncate(0))
		
		factoryCofre.imagenesArmas(["espada.png","Labrys.png","palo3"])
		repeat.cant(6, { factoryCofre.crearCofreEnemigo(pos, 10, 22)})
		
		repeat.cant(1, { factoryCofre.crearCofreSalud(pos)})
		repeat.cant(2, { factoryCofre.crearCofreVeneno(pos)})
		
		repeat.cant(3,{factoryCofre.crearCofreEnemigoConLlave(pos,10,22)})
		
		repeat.cant(3, { factoryCofre.crearCofreArma(pos,3,6)})
		
		repeat.cant(3, { factoryCofre.crearCofreBomba(pos)})
	}
	
}

