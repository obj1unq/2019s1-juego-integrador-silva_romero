//Superclases para que todos los objetos hereden de aca


//Que un objeto sea colisionable quiere decir que el jugador lo puede pasar por encima
//Metodos usados dentro de personaje.mover(pos, dir)


class NoColisionable {
	method esColisionable() = false
	
}

class Colisionable {
	method esColisionable() = true
	
}

class FondoNegro {
	method image() = "negro.png"
}