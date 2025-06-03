# Informe

Para hacer esta entrega hemos decidido partir de la [fase 4](../p8/Robot_Jerarquico.adb). Hemos añadido un nivel superior que es el tipo de misión, un nuevo sensor que es si hay un enemigo, una meta de disparar y un contador de balas.

El robot sigue ejecutando 5 ciclos como antes. Empieza con una bala y lo primero que hace es leer los sensores. El estado de los sensores se lo pasa ahora al `Planificador_Estrategico_Alto_Nivel`. El robot solo puede tener un tipo de misión (`Mision_tipo`) a la vez: `Explorar`, `Defender` o `Recargar`.

A continuación, se le pasa la misión, el estado de los sensores y el contador de balas al `Planificador_Estrategico`. Si la misión es `Explorar` añade la meta de `Moverse` si hay camino libre. Si la misión es `Defender` se añade la meta de `Disparar` si hay un enemigo y si no hay balas se añade la meta de `Recargar_Balas`. Si la misión es `Recargar` se añade la meta de `Cargar_Bateria` y si hay el camino está libre se añade la meta de `Moverse`. Finalemte siempre se añade la meta de `Evitar_Obstaculo`.

Lo siguiente es usar el `Planificador_Tactico` con las metas y el estado de los sensores. Los cambios que añadimos es que ahora se añaden una acción de para disparar y otra para recargar balas. Se dispara si hay la meta de `Disparar` y se añade dinámicamente el tipo de enemigo con el sensor `TipoEnemigo`.La acción para recargar balas tiene prioridad 11 y la de disparar 10.

Finalmente se ordenan las acciones según su prioridad y se ejecutan en orden. Lo nuevo es que la task `DispararAlEnemigo` se ejecuta con el número del tipo de enemigo y imprime por pantalla que se disparan distintos tipos de armas.
