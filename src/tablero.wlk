import wollok.game.*
import otros_obj.*
import llave.*
import  bomba.*
import factory.*
import hongos.*
import arma.*
import enemigo.*
// OBJETO USADO PARA CREAR TODOS LOS COFRES QUE VAN A APARECER EN EL JUEGO
object tablero {
	
	
	// Aqui se asigna la cantidad de cofres que va a tener cada nivel y los cofres de armas y enemigos especificos por cada nivel.
	
	method cargarCofresDelNivel1() {

		var imagenesArmas = [ "martillo.png", "hoz.png", "arco1.png" ]
				
		const pos = game.at(1.randomUpTo(game.width() - 1).truncate(0), 1.randomUpTo(game.height() - 5).truncate(0))
		factoryCofre.enemigosPosibles([megaMan,pacman,donkey])
		// vida de enemigo: 6 a 12
		// nivel de  ataque del arma: 1 a 3
		repeat.cant(2, { factoryCofre.crearCofreDe(new Bomba(position = pos),pos)})	
		
		repeat.cant(2,{factoryCofre.crearCofreDe(new Llave(),pos)})
		repeat.cant(3, { factoryCofre.crearCofreEnemigo(pos, 6, 12,new HongoSeguro(efecto = 2.randomUpTo(5).truncate(0)))})
		factoryCofre.crearCofreEnemigo(pos, 6, 12,new Llave())
		repeat.cant(4, { factoryCofre.crearCofreDe(new HongoSalud(efecto = 2.randomUpTo(5).truncate(0)),pos)})
		repeat.cant(2, { factoryCofre.crearCofreDe( new HongoVeneno(efecto = 2.invert().randomUpTo(5.invert()).truncate(0)),pos)})
		repeat.cant(2, { factoryCofre.crearCofreDe(new Arma(image=  imagenesArmas.get(0.randomUpTo(imagenesArmas.size()).truncate(0)),
												 	mejoraAtk = 1.randomUpTo(3).truncate(0)),pos)})
		
	}

	method cargarCofresDelNivel2() {
		var imagenesArmas = [ "arma.png", "maso.png", "espada.png" ]
		// vida de enemigo: 8 a 15
		// nivel de  ataque del arma: 3 a 5
		const pos = game.at(1.randomUpTo(game.width() - 1).truncate(0), 1.randomUpTo(game.height() - 5).truncate(0))
		
	
		factoryCofre.enemigosPosibles([browser,metroid])
		repeat.cant(2, { factoryCofre.crearCofreDe(new Bomba(position = pos),pos)})	
		
		factoryCofre.crearCofreDe(new Llave(),pos)
		repeat.cant(4, { factoryCofre.crearCofreEnemigo(pos, 6, 12,new HongoSeguro(efecto = 2.randomUpTo(5).truncate(0)))})
		repeat.cant(2,{factoryCofre.crearCofreEnemigo(pos, 6, 12,new Llave())})
		repeat.cant(2, { factoryCofre.crearCofreDe(new HongoSalud(efecto = 2.randomUpTo(5).truncate(0)),pos)})
		repeat.cant(2, { factoryCofre.crearCofreDe( new HongoVeneno(efecto = 2.invert().randomUpTo(5.invert()).truncate(0)),pos)})
		repeat.cant(2, { factoryCofre.crearCofreDe(new Arma(image=  imagenesArmas.get(0.randomUpTo(imagenesArmas.size()).truncate(0)),
												 	mejoraAtk = 1.randomUpTo(3).truncate(0)),pos)})
	}

	method cargarCofresDelNivel3() {
		var imagenesArmas = ["palo3.png","Labrys.png","espada3.png"]
		// vida de enemigo: 10 a 22
		// nivel de  ataque del arma: 6 a 8
		const pos = game.at(1.randomUpTo(game.width() - 1).truncate(0), 1.randomUpTo(game.height() - 5).truncate(0))
		
		factoryCofre.enemigosPosibles([zelda,link,dragon])
		
		
		
		repeat.cant(3, { factoryCofre.crearCofreEnemigo(pos, 6, 12,new HongoSeguro(efecto = 2.randomUpTo(5).truncate(0)))})
		repeat.cant(3, {factoryCofre.crearCofreEnemigo(pos, 6, 12,new Llave())})
		repeat.cant(1, { factoryCofre.crearCofreDe(new HongoSalud(efecto = 2.randomUpTo(5).truncate(0)),pos)})
		repeat.cant(2, { factoryCofre.crearCofreDe( new HongoVeneno(efecto = 2.invert().randomUpTo(5.invert()).truncate(0)),pos)})
		repeat.cant(3, { factoryCofre.crearCofreDe(new Arma(image=  imagenesArmas.get(0.randomUpTo(imagenesArmas.size()).truncate(0)),
												 	mejoraAtk = 6.randomUpTo(8).truncate(0)),pos)})
		repeat.cant(2, { factoryCofre.crearCofreDe(pos,new Bomba(position = pos))})
	}
	
}

