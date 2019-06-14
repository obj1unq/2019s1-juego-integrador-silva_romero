import wollok.game.*
import personaje.*
import otros_obj.*

// OBJETO USADO PARA CREAR TODOS LOS COFRES QUE VAN A APARECER EN EL JUEGO(CANTIDAD A DETERMINAR) (GT)

object tablero {
	
	
	method cargarCofres(){
		var pos = game.at(5,4.randomUpTo(7).truncate(0)) // hace el codigo mas legible 
		
	factoryCofre.crearCofreEnemigo(pos)
	factoryCofre.crearCofreEnemigo(pos)
	factoryCofre.crearCofreEnemigo(pos)
	factoryCofre.crearCofreEnemigo(pos)
	
	factoryCofre.crearCofrePocion(pos)
	factoryCofre.crearCofrePocion(pos)
	
	factoryCofre.crearCofreVeneno(pos)
	factoryCofre.crearCofreVeneno(pos)
	
	factoryCofre.crearCofreLlave(pos)
	factoryCofre.crearCofreLlave(pos)
	factoryCofre.crearCofreLlave(pos)
	
	factoryCofre.crearCofreArma(pos)
	factoryCofre.crearCofreArma(pos)
	}
}