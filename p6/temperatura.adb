package body Temperatura is
   function Crear return Sensor is
      S : Sensor;
   begin
      return S;
   end Crear;
   procedure Actualizar (S : in out Sensor; Valor : Float) is
   begin
      S.Valor_Temp := Valor;
   end Actualizar;
   function Leer (S : Sensor) return Float is
   begin
      return S.Valor_Temp;
   end Leer;
end Temperatura;
