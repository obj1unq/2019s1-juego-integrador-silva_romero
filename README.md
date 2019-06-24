# Escape (nombre temporal)

## Miembros del Grupo
Bárbara Silva Mesquita, Melanie Romero, Gonzalo Torrez y Leonel Delgado.

## Objetivo:
El juego consiste en que el personaje principal llegue hasta la salida pero para ello deberá encontrar las 3 llaves que le permitiran cruzar la salida y por ende ganar el juego. Estas se encuentran escondidas en cofres por todo el tablero con lo cual se debera tener mucho cuidado al elegir uno ya que estos pueden contener, ademas de potenciadores que mejoren la salud o armas que mejoren el ataque, enemigos, venenos que atenten con la vida del personaje o bombas. 

### El personaje : 
Tiene atributos como puntos de vida, de ataque y una mochila donde recolecte las llaves y armas. Es el unico que se desplaza por el tablero y que puede interactuar con los objetos. Puede con las armas que encuentre en los cofres pero solo puede tener una a la vez, si el jugador quiere otra arma, puede reemplazarla por otra nueva que encuentre si es que lo beneficia.

### Cofres :
Van a estar repartidos por todo el tablero y cada uno tendra un objeto diferente. Hasta que el personaje no interactue con estos no se sabrá qué puede contener cada uno. Solo pueden contener un tipo de objeto.  Estos pueden ser hongos de salud o venenosos que modifican los atributos del personaje segun corresponda, una llave, enemigos escondidos o armas que mejoren las estadisticas del personaje.

### Enemigos : 
Estos tambien tienen atributos de vida , ataque y un objeto. La recompensa por acabar con ellos sera un hongo de salud con puntos variables o una llave , para que el jugador se vea obligado a enfrentarlos. A medida que el jugador avanza de nivel la cantida de enemigos que posean llaves aumenta. Estos atacan al personaje principal por cada tres ataques que el personaje principal les inflije.

### Puerta de salida:
Al interactuar con este, debe verificar que el personaje tenga las tres llaves para que avanzar de nivel y asi terminar el juego. En caso contrario da un mensaje de que le faltan llaves.


___
# IMPLEMENTACIÓN
___


### Personaje
* Puede moverse en las cuatro direcciones, atacar con la tecla E e interactuar con espacio.
* Atacar significa pararme al lado del enemigo y apretar un boton para atacar. Cuando ataco, le saco X cantidad de vida al enemigo que tengo en la direccion a la que estoy mirando (la celda adyacente al personaje). Despues de atacar al enemigo 3 veces, ese enemigo me ataca a mi y me hace daño. 
* Interactuar significa intentar abrir la puerta, intercambiar el arma que esta en el suelo con el arma que tiene en el inventario (si tiene), o abrir un cofre.
* Puede llevar como maximo un arma en el inventario.
* Tiene un atributo ataque, que se usa para pelear!! Este atributo deberia cambiar dependiendo el arma que tiene en el inventario.
* Tiene como maximo 10 puntos de vida.
* Puede agarrar llaves o frascos al pasar por encima de ellos. Agarrar una llave significa sumar 1 a la cantidad de llaves que posee. Agarrar un frasco significa recibir el efecto del frasco.
* Si ya tiene toda la vida, y el frasco es una pocion (que lo cura), no puede agarrar el frasco que esta en el piso.
* La imagen del personaje cambia conforme en la direccion en la que estoy mirando. La direccion que estoy mirando cambia segun la tecla que presiono para moverme.
* Cuando el personaje agarra un arma, la imagen del mismo cambia para mostrar el arma que lleva en mano. Si son 5 armas más el personaje sin armas, y son 4 direcciones, en total son 6 * 4 = 24 imagenes para el personaje!!!
* Cuando ataco, muestro una animacion del personaje disparando o usando su arma en la direccion a la que veo. Necesito el doble de imagenes para hacer esto.
* El personaje, por defecto, tiene 1 punto de ataque. Cuando agarra el arma, se le suma al punto de ataque que tiene.
* Al atacar suena un sonido.



### Hongos

* Un hongo de salud puede curar entre 2 y 5 puntos de vida. 
* Un hongo venenoso hace daño de entre 2 y 5 puntos de vida.


### Llaves
* Al colisionar con el jugador, desaparecen del tablero y pasan a estar en su inventario.


### Puerta
* Cuando el jugador intenta abrirla, verifica que tiene la cantidad de llaves necesaria para pasar de nivel.
* Si puede abrirla, y es el ultimo nivel, se muestra una pantalla/animacion de victoria.
* Si puede abrirla, y no es el ultimo nivel, se genera el siguiente nivel.


### Bombas
* Una bomba puede aparecer en cofres.
* Si el jugador se encuentra con una de estas en el momento en que explota, SE MUERE.
* La bomba explota luego de 300ms de aparecer.


### Armas
* Pueden ser recogidas por el jugador. Si el jugador ya tenia un arma, la intercambia por la que recoge.
* Cada arma tiene sus puntos de ataque que le sumarán al jugador según el arma que tenga en mano.
* Existen cuatro armas en el juego. En el primer nivel solo pueden encontrarse armas con mejoras entre 1 y 3 puntos, en el segundo nivel de 2 a 4 puntos, y en el último nivel se puede encontrar con armas  de entre 3 a 6 puntos.


### Enemigos

* Todos los enemigos tienen diferentes puntos de ataque y de vida. No todos los enemigos tienen lo mismo, es aleatorio.
* Solo atacan al jugador cuando son atacados por tercera vez por el mismo
* Le quitan vida al jugador segun la cantidad de daño que pueden hacer.
* El jugador no sabe cuanto daño hacen ni cuanta vida tienen.
* En todos los niveles tienen entre 2 y 5 puntos de ataque.
* En el nivel 1 aparecen enemigos de entre 6 y 12 puntos de vida.
* En el nivel 2 aparecen enemigos de entre 8 y 15 puntos de vida.
* En el nivel 3 aparecen enemigos de entre 10 y 22 puntos de vida.
* Cada enemigo tiene su animación (se puede hacer con solo 2 imagenes por cada enemigo).


### Niveles
* En total son tres.
* Cada nivel cambia la cantidad de cofres que se generan en el mismo.
* Cada nivel tiene una ambientación diferente.


### Menu
* Una barra de estatus que se muestra por encima del area de juego.
* Muestra el arma que llevo en el inventario (si tengo), la cantidad de vida que tengo representado con corazones, la cantidad de daño que hago, alguna represenación del nivel en el que estoy jugando y un reloj que va pasando el tiempo.


### Otros
* Si me quedo sin vida, o se me acaba el tiempo, pierdo el juego.
* En el primer nivel hay dos llaves en cofres, la tercera la tiene un enemigo.
* En el segundo nivel hay una llave en cofres, dos llaves la tienen dos enemigos.
* En el tercer nivel no hay llaves en cofres,  la tienen tres enemigos.


###  Direcciones
* Una clase que ayuda a la implementación del personaje.
* Guarda imágenes del personaje viendo en las diferentes orientaciones y métodos que ayuden a verificar la dirección en la que está mirando.

### Colisionable y NoColisionable
* Clases que le dan la propiedad a otras clases u objetos de que puedan ser colisionables o no (por medio de herencia).
* Ser colisionable significa que el jugador puede caminar por encima de la posición en la que se encuentra el objeto.
