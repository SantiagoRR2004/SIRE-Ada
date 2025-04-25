# Ejercicios

## [etapa_1_accept](../p7/etapa_1_accept.adb)

**¿Qué sucede si el bucle que se encuentra en el Productor es de 2 en vez de 3? Razonar la respuesta.**

Se queda el Consumidor en la espera en la cola. La tarea no permite que se consuma sin extraer antes.

## [etapa_2_accept](../p7/etapa_2_accept.adb)

**¿Qué sucede si el bucle que se encuentra en el Productor es de 2 en vez de 3 o si el delay en el Productor aumenta a 2.0? Razonar la respuesta.**

## [etapa_4_guarda_select_accept](../p7/etapa_4_guarda_select_accept.adb)

**¿Qué sucede si el bucle que se encuentra en el Productor es de 2 en vez de 3? ¿Termina en algun momento?**

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
