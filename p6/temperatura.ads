package Temperatura is
type Sensor is private;
function Crear return Sensor;
procedure Actualizar(S : in out Sensor; Valor : Float);
function Leer(S : Sensor) return Float;
private
type Sensor is record
Valor_Temp : Float := 0.0;
end record;
end Temperatura;