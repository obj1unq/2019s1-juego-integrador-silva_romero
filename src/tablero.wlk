import wollok.game.*
import personaje.*
import otros_obj.*
import reloj.*
import factory.*
// OBJETO USADO PARA CREAR TODOS LOS COFRES QUE VAN A APARECER EN EL JUEGO(GT)

object tablero {
	
	// Aqui se asigna la cantidad de cofres que va a tener cada nivel y los cofres de armas y enemigos especificos por cada nivel.(GT)
	
	method cargarCofresDelNivel1(){
		
		var pos = game.at(1.randomUpTo(game.width() - 1).truncate(0),1.randomUpTo(game.height() - 5).truncate(0))
		
	//factoryCofre.crearCofreEnemigoNivel1(pos)
	//factoryCofre.crearCofreEnemigoNivel1(pos)
	//factoryCofre.crearCofreEnemigoNivel1(pos)
	//factoryCofre.crearCofreEnemigoNivel1(pos)
	
	factoryCofre.crearCofrePocion(pos)
	factoryCofre.crearCofrePocion(pos)
	
	factoryCofre.crearCofreVeneno(pos)
	factoryCofre.crearCofreVeneno(pos)
	
	factoryCofre.crearCofreLlave(pos)
	factoryCofre.crearCofreLlave(pos)
	
	factoryCofre.crearCofreArmaNivel1(pos)
	factoryCofre.crearCofreArmaNivel1(pos)
	
	factoryCofre.crearCofreBomba(pos)
	factoryCofre.crearCofreBomba(pos)
	factoryCofre.crearCofreBomba(pos)
	}
	
	method cargarCofresDelNivel2(){
		
		var pos = game.at(1.randomUpTo(game.width() - 1).truncate(0),1.randomUpTo(game.height() - 5).truncate(0))
		
	factoryCofre.crearCofreEnemigoNivel2(pos)
	factoryCofre.crearCofreEnemigoNivel2(pos)
	factoryCofre.crearCofreEnemigoNivel2(pos)
	factoryCofre.crearCofreEnemigoNivel2(pos)
	
	factoryCofre.crearCofrePocion(pos)
	factoryCofre.crearCofrePocion(pos)
	
	factoryCofre.crearCofreVeneno(pos)
	factoryCofre.crearCofreVeneno(pos)
	
	factoryCofre.crearCofreLlave(pos)
	factoryCofre.crearCofreLlave(pos)
	
	factoryCofre.crearCofreArmaNivel2(pos)
	factoryCofre.crearCofreArmaNivel2(pos)
	
	factoryCofre.crearCofreBomba(pos)
	factoryCofre.crearCofreBomba(pos)
	factoryCofre.crearCofreBomba(pos)
	}
	
	method cargarCofresDelNivel3(){
		
		var pos = game.at(1.randomUpTo(game.width() - 1).truncate(0),1.randomUpTo(game.height() - 5).truncate(0))
		
	factoryCofre.crearCofreEnemigoNivel3(pos)
	factoryCofre.crearCofreEnemigoNivel3(pos)
	factoryCofre.crearCofreEnemigoNivel3(pos)
	
	factoryCofre.crearCofrePocion(pos)
	factoryCofre.crearCofrePocion(pos)
	
	factoryCofre.crearCofreVeneno(pos)
	factoryCofre.crearCofreVeneno(pos)
	
	factoryCofre.crearCofreLlave(pos)
	factoryCofre.crearCofreLlave(pos)
	
	factoryCofre.crearCofreArmaNivel3(pos)
	factoryCofre.crearCofreArmaNivel3(pos)
	
	factoryCofre.crearCofreBomba(pos)
	factoryCofre.crearCofreBomba(pos)
	factoryCofre.crearCofreBomba(pos)
	}
}