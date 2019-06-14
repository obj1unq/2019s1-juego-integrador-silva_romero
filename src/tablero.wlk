import wollok.game.*
import personaje.*
import otros_obj.*

// OBJETO USADO PARA CREAR TODOS LOS COFRES QUE VAN A APARECER EN EL JUEGO(CANTIDAD A DETERMINAR) (GT)

object tablero {
	
	
	method cargarCofres(){
	factoryCofre.crearCofreEnemigo()
	factoryCofre.crearCofreEnemigo()
	factoryCofre.crearCofreEnemigo()
	factoryCofre.crearCofreEnemigo()
	factoryCofre.crearCofrePocion()
	factoryCofre.crearCofreVeneno()
	factoryCofre.crearCofrePocion()
	factoryCofre.crearCofreVeneno()
	factoryCofre.crearCofreLlave()
	factoryCofre.crearCofreLlave()
	factoryCofre.crearCofreLlave()
	factoryCofre.crearCofreArma()
	factoryCofre.crearCofreArma()
	}
}