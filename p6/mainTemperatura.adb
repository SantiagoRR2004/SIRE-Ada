with Ada.Text_IO, Temperatura, Ada.Real_Time;
use Ada.Text_IO, Temperatura, Ada.Real_Time;

procedure mainTemperatura is
   -- Crear el sensor
   S           : Sensor := Crear;
   Temp_Actual : Float;
   -- Guarda la hora de inicio del programa. Clock devuelve la hora actual
   -- según el reloj del sistema.
   Inicio      : Time := Ada.Real_Time.Clock;
begin
   loop
      declare
         -- Obtener el número de segundos desde el inicio del programa
         Ahora        : Time := Ada.Real_Time.Clock;
         -- (Ahora - Inicio) da un Time_Span (tiempo pasado desde que
         -- empezó el programa)
         -- To_Duration convierte el Time_Span a segundos (Duration), y se
         -- convierte a Float.
         Time_Seconds : Float := Float (To_Duration (Ahora - Inicio));
         -- Simulación de temperatura
         Valor        : Float := 20.0 + Float'Remainder (Time_Seconds, 15.0);
      begin
         Actualizar (S, Valor);
         Put_Line ("Sensor: Temperatura actualizada a" & Float'Image (Valor));
      end;
      -- Leer la temperatura del sensor y controlar
      Temp_Actual := Leer (S);
      Put_Line
        ("Controlador: Temperatura leída =" & Float'Image (Temp_Actual));
      if Temp_Actual > 25.0 then
         Put_Line ("¡Alerta! Temperatura alta.");
      end if;
      -- Espera de 1 segundo antes de continuar
      delay 1.0;
   end loop;
end mainTemperatura;
