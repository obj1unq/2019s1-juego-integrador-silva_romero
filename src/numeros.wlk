class Numeros {

	method image()

	method anterior()

	method tipo()

}

object cero inherits Numeros {

	override method image() = "cero.png"

	override method anterior() = nueve

	override method tipo() = 0

}

object uno inherits Numeros {

	override method image() = "uno.png"

	override method anterior() = cero

	override method tipo() = 1

}

object dos inherits Numeros {

	override method image() = "dos.png"

	override method anterior() = uno

	override method tipo() = 2

}

object tres inherits Numeros {

	override method image() = "tres.png"

	override method anterior() = dos

	override method tipo() = 3

}

object cuatro inherits Numeros {

	override method image() = "cuatro.png"

	override method anterior() = tres

	override method tipo() = 4

}

object cinco inherits Numeros {

	override method image() = "cinco.png"

	override method anterior() = cuatro

	override method tipo() = 5

}

object seis inherits Numeros {

	override method image() = "seis.png"

	override method anterior() = cinco

	override method tipo() = 6

}

object siete inherits Numeros {

	override method image() = "siete.png"

	override method anterior() = seis

	override method tipo() = 7

}

object ocho inherits Numeros {

	override method image() = "ocho.png"

	override method anterior() = siete

	override method tipo() = 8

}

object nueve inherits Numeros {

	override method image() = "nueve.png"

	override method anterior() = ocho

	override method tipo() = 9

}
