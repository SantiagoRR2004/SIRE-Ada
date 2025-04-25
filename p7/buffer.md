# Ejercicios

## [etapa_1_accept](../p7/etapa_1_accept.adb)

**¿Qué sucede si el bucle que se encuentra en el Productor es de 2 en vez de 3? Razonar la respuesta.**

Se queda el Consumidor en la espera en la cola. La tarea no permite que se consuma sin extraer antes. Esto se debe a que la tarea se queda esperando a que se haga un insertar y luego se queda esperando a que se haga un extraer. Se reinicia el bucle y otra vez lo mismo. No se pueden hacer dos Insertar seguidos o dos Extraer seguidos.

## [etapa_2_accept](../p7/etapa_2_accept.adb)

**¿Qué sucede si el bucle que se encuentra en el Productor es de 2 en vez de 3 o si el delay en el Productor aumenta a 2.0? Razonar la respuesta.**

En el caso de aumentar el delay, haría en primer lugar el extraer, extrayendo un 0 en el primer bucle y dejando al final, el 3 sin extraer. Por otro lado, si bajamos el número de iteracciones a 2, el último extraer, cojerá un 0.

Esto se debe al select-or, pues ya no hay un orden establecido que obliga a en primer lugar hacer el insertar y luego el extraer. Puedo hacer dos extraer seguidos o un extraer antes del insertar debido.

## [etapa_4_guarda_select_accept](../p7/etapa_4_guarda_select_accept.adb)

**¿Qué sucede si el bucle que se encuentra en el Productor es de 2 en vez de 3? ¿Termina en algun momento?**

Dado que no se inserta el tercer valor, gracias a la condición when, no se extrae un cero (no se extrae nada, se queda esperando). No termina el programa, las dos tareas se pasan al delay e imprimen indefinidamente "Esperando actividad...".

## [etapa_5_term_temp_guarda_select_accept](../p7/etapa_5_term_temp_guarda_select_accept.adb)

**¿Qué sucede si se añade a la tarea buffer lo siguiente?:**

```ada
or
-- Si no hay actividad en el buffer, esperar 1 segundo
delay 1.0;
Put_Line("Esperando actividad...");
```

Da el siguiente error de compilación:

```bash
etapa_5_term_temp_guarda_select_accept.adb:12:10: error: at most one of "terminate" or "delay" alternative
```

Significa que hay que hay escoger entre `terminate` o `delay`.
