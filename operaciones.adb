with Ada.Text_IO;         use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
procedure Operaciones is
   A, B : Integer;
begin
   Put ("Introduce el primer número: ");
   Get (A);
   Put ("Introduce el segundo número: ");
   Get (B);
   Put_Line ("Suma: " & Integer'Image (A + B));
   Put_Line ("Resta: " & Integer'Image (A - B));
   Put_Line ("Multiplicación: " & Integer'Image (A * B));
   Put_Line ("División: " & Integer'Image (A / B));
end Operaciones;
