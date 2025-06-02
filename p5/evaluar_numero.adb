with Ada.Text_IO;         use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure Evaluar_Numero is
   N : Integer;
begin
   Put ("Introduce un número: ");
   Get (N);
   if N > 0 then
      Put_Line ("El número es positivo.");
   elsif N < 0 then
      Put_Line ("El número es negativo.");
   else
      Put_Line ("El número es cero.");
   end if;
end Evaluar_Numero;
