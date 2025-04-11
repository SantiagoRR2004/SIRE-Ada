with Ada.Text_IO;
use Ada.Text_IO;
package body Temperatura_Entry is
task body Sensor_Tarea is
Temp : Float := 0.0;
begin
loop
Put_Line("Esperando actualizar...");
accept Actualizar(Valor : Float) do
Temp := Valor;
Put_Line("actualizado...");
end Actualizar;
Put_Line("Esperando leer ...");
accept Leer(Valor : out Float) do
Valor := Temp;
Put_Line("le´ıdo...");
end Leer;
end loop;
end Sensor_Tarea;
end Temperatura_Entry;