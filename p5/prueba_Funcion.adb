with Ada.Text_IO; use Ada.Text_IO;

procedure Prueba_Funcion is
   function Cuadrado (N : Integer) return Integer is
   begin
      return N * N;
   end Cuadrado;
   Resultado : Integer;
begin
   Resultado := Cuadrado (4);
   Put_Line ("El cuadrado de 4 es: " & Integer'Image (Resultado));
end Prueba_Funcion;
