with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
procedure Excepciones is
Num : Integer;
begin
begin
Put("Introduce un número entero: ");
Get(Num);
Put_Line("Número insertado: " & Integer'Image(Num));
exception
when Data_Error =>
Put_Line("Error: Entrada inválida. Introduce un número entero.");
end;
end Excepciones;