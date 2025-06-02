with Ada.Text_IO; use Ada.Text_IO;
with Operaciones;

procedure MainOperaciones is
begin
   Put_Line ("Suma 3 + 4 = " & Integer'Image (Operaciones.Sumar (3, 4)));
   Put_Line
     ("Multiplicación 3 * 4 = "
      & Integer'Image (Operaciones.Multiplicar (3, 4)));
   Put_Line ("Cuadrado de 5 = " & Integer'Image (Operaciones.Cuadrado (5)));
end MainOperaciones;
