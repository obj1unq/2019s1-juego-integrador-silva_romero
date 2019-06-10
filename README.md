# Escape (nombre temporal)

## Miembros del Grupo
Bárbara Silva Mesquita, Melanie Romero, Gonzalo Torrez y Leonel Delgado.

## Objetivo:
El juego consiste en que el personaje principal llegue hasta la salida pero para ello deberá encontrar las 3 llaves que le permitiran cruzar la salida y por ende ganar el juego. Estas se encuentran escondidas en cofres por todo el tablero con lo cual se debera tener mucho cuidado al elegir uno ya que estos pueden contener, ademas de potenciadores que mejoren la salud o la fuerza de ataque, enemigos o venenos que atenten con la vida del personaje. 

### El personaje : 
Debe contar con atributos como puntos de vida, de ataque y una mochila donde recolecte las llaves. Es el unico que se desplaza por el tablero y que puede interactuar con los objetos. Puede equiparce con armas que encuentre en los cofres pero solo puede tener una a la vez, si el jugador quiere otra arma debera dejar la que tiene y reemplazarla por la nueva que elija.

### Cofres :
Van a estar repartidos por todo el tablero y cada uno tendra un objeto diferente. Hasta que el personaje no interactue con estos no se sabrá qué puede contener cada uno. Solo pueden contener un tipo de objeto.  Estos pueden ser potenciadores de vida o de ataque que se suman a los atributos del personaje, venenos que le resten puntos de vida o ataque, tener una llave, enemigos escondidos o armas que mejoren las estadisticas del personaje.

### Enemigos : 
Estos tambien tienen atributos de vida , ataque y un objeto. La recompensa por acabar con ellos sera el objeto que posean. Uno si o si debera tener una llave , para que el jugador se vea obligado a enfrentarlos. Al enfrentarse al personaje principal si estos tienen mas puntos de ataque que la vida del personaje, esto lo matan perdiendo asi el juego. Si el personaje lo derrota siempre pierde algo de vida(definir cuanto). Ocultar los atributos para que no se sepa la vida y ataque de estos.

### Puerta de salida:
al interactuar con este objeto, debe verificar que el personaje tenga las tres llaves para que se termine el juego. En caso contrario que tire un mensaje o excepcion de cuantas llaves le falta o que le faltan.


### Para mel:

TRES niveles (vemos como va, por ahi ponemos mas)

Bombassss!!! (al abrir cofres)

Juego por tiempo

Un boton para atacar, un boton para interactuar, botones de movimiento

Enemigos tienen distinto tipo de ataque y distinta vida

Un enemigo cada 3 ataques te saca una cierta cantidad. Cuando ataco 3 veces a un enemigo, ESE enemigo me ataca. Pueden existir enemigos que los mate de 2 ataques.
 


El personaje que tenga 5 de vida.
Maximo de vida: 5 corazones.

Si el personaje tiene 5 corazones, no puedo agarrar pociones

NO puedo saber cuanta vida y atk tienen los enemigos, es prueba y error

Mecanismo de ataque todo igual (con estas modificaciones)

ARMAS de FUEGO!! (igual sigue atacando al que tiene al lado, no a distancia)

Atacar significa pararme al lado del enemigo y apretar un boton para atacar.
Cuando ataco, le saco X cantidad de vida al enemigo que tengo en la direccion a la que estoy mirando (la celda adyacente al personaje). Despues de atacar al enemigo 3 veces, ese enemigo me ataca a mi y me hace daño. 

El enemigo lo ataca solo cuando el jugador interactua con el por tercera vez. El calculo es el siguiente:

vidaEnemigo = self.vida() - jugador.ataque()

(si es la tercera vez que lo ataca)
vidaJugador = self.vida() - enemigo.ataque()

OJO!! El ataque es con ESE enemigo, NO con todos los enemigos.

sugerencia: representar cada medio corazon con un punto de vida. 2 puntos de vida = 1 corazon. 10 puntos de vida = 5 corazones. Esto es para no tener que usar fracciones.

No hace falta implementar algo que te guarde corazones, de eso se encarga la interfaz del juego. Con que sean puntos de vida basta.

No todos los enemigos tienen la misma cantidad de vida y la misma cantidad de ataque. Ataques posibles del enemigo:
entre 0.5 y 2 corazones (osea, entre 1 y 4 puntos de vida).
