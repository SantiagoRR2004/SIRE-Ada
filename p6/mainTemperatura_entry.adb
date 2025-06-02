with Ada.Text_IO, Temperatura_Entry, Ada.Real_Time;
use Ada.Text_IO, Temperatura_Entry, Ada.Real_Time;

procedure MainTemperatura_entry is
   S           : Sensor_Tarea;
   Temp_Actual : Float;
   Inicio      : Time := Clock;
begin
   loop
      declare
         Ahora        : Time := Clock;
         Time_Seconds : Float := Float (To_Duration (Ahora - Inicio));
         Valor        : Float := 20.0 + Float'Remainder (Time_Seconds, 10.0);
      begin
         S.Actualizar (Valor);
         Put_Line ("Sensor: Temperatura actualizada a" & Float'Image (Valor));
      end;
      S.Leer (Temp_Actual);
      Put_Line
        ("Controlador: Temperatura leída =" & Float'Image (Temp_Actual));
      if Temp_Actual > 25.0 then
         Put_Line ("¡Alerta! Temperatura alta.");
      end if;
      delay 1.0;
   end loop;
end MainTemperatura_entry;
