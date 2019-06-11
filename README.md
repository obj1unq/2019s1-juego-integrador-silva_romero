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



### Frascos
* Los frascos aparecen en cofres.
* Existen dos tipos de frascos: pociones (que curan) y venenos (que hacen daño).
* Los efectos aplican al colisionar con el jugador.
* Un frasco puede curar entre 2 y 5 puntos de vida. //falta discutir bien esto.
* Un veneno hace daño de entre 2 y 5 puntos de vida. //falta discutir bien esto.


### Llaves
* Al colisionar con el jugador, desaparecen del tablero y pasan a estar en su inventario.


### Puerta
* Cuando el jugador intenta abrirla, verifica que tiene la cantidad de llaves necesaria para pasar de nivel.
* Si no puede abrirla, le dice que le faltan "x" llaves.
* Si puede abrirla, y es el ultimo nivel, se muestra una pantalla/animacion/loquesea de victoria.
* Si puede abrirla, y no es el ultimo nivel, se escucha un sonido de una puerta abriendose y se genera el siguiente nivel.


### Bombas
* Una bomba puede aparecer en cofres.
* Si el jugador se encuentra en una casilla adyacente o en diagonal a la bomba en el momento en que explota, SE MUERE.
* La bomba explota luego de 500ms de aparecer.


### Cofres
* Al ser abiertos, desaparecen y revelan su contenido.
* WIP

### Armas
* Aparecen en cofres.
* Pueden ser recogidas por el jugador. Si el jugador ya tenia un arma, la intercambia por la que recoge.
* Cada arma tiene sus puntos de ataque que le sumarán al jugador según el arma que tenga en mano.
* Existen cinco armas en el juego, que suman respectivamente 2, 3, 4, 5 y 6 puntos de ataque al jugador. En el primer nivel solo pueden encontrarse las primeras dos armas, en el segundo nivel las siguientes dos (más las dos primeras), y en el último nivel se puede encontrar cualquiera de las cinco.


### Enemigos
* Aparecen en cofres.
* Todos los enemigos tienen diferentes puntos de ataque y de vida. No todos los enemigos tienen lo mismo, es aleatorio.
* Solo atacan al jugador cuando son atacados por tercera vez por el mismo (OJO!! El ataque es con ESE enemigo, NO con todos los enemigos).
* Pueden existir enemigos que mueran de uno o dos golpes.
* Le quitan vida al jugador segun la cantidad de daño que pueden hacer.
* El jugador no sabe cuanto daño hacen ni cuanta vida tienen.
* En todos los niveles tienen entre 1 y 4 puntos de ataque.
* En el nivel 1 aparecen enemigos de entre 4 y 12 puntos de vida.
* En el nivel 2 aparecen enemigos de entre 6 y 15 puntos de vida.
* En el nivel 3 aparecen enemigos de entre 8 y 22 puntos de vida.
* Cada enemigo tiene su animación (se puede hacer con solo 2 imagenes por cada enemigo).
* Aunque pueden existir diferentes imagenes para diferentes enemigos, eso no significa que existan tipos de enemigos específicos. Los unicos "tipos" de enemigos que hay se diferencian por el nivel en el que están, no por sus imágenes.


### Niveles
* En total son tres.
* Cada nivel cambia el tamaño del area de juego y la cantidad de cofres que se generan en el mismo.
* Cada nivel tiene una ambientación diferente.
* <??> Podria ser que se necesiten diferentes cantidades de llaves por cada nivel.


### Menu
* Una barra de estatus que se muestra por encima del area de juego.
* Muestra el arma que llevo en el inventario (si tengo), la cantidad de vida que tengo representado con corazones y medio-corazones, la cantidad de daño que hago representado con <¿?>, alguna represenación del nivel en el que estoy jugando y un reloj que va pasando el tiempo.

### Reloj
* WIP
* WIP

### Otros
* Si me quedo sin vida, o se me acaba el tiempo, pierdo el juego (y suena una fanfarria de derrota).
* Si paso todos los niveles, gano (y suena una fanfarria de victoria).
* Para avanzar de nivel, tengo que juntar las 3 llaves e interactuar con la puerta.
* Hay dos llaves en cofres, la tercera la tiene un enemigo que esta dentro de un cofre.
* OST del juego: Running in the 90s


###  Direcciones
* Una clase que ayuda a la implementación del personaje.
* Guarda imágenes del personaje viendo en las diferentes orientaciones y métodos que ayuden a verificar la dirección en la que está mirando.

### Colisionable y NoColisionable
* Clases que le dan la propiedad a otras clases u objetos de que puedan ser colisionables o no (por medio de herencia).
* Ser colisionable significa que el jugador puede caminar por encima de la posición en la que se encuentra el objeto.

___

## Cosas para preguntar

- Hace falta hacer tests?
- 
