package Temperatura_Entry is
   task type Sensor_Tarea is
      entry Actualizar (Valor : Float);
      entry Leer (Valor : out Float);
   end Sensor_Tarea;
end Temperatura_Entry;
