with Ada.Text_IO;         use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure Pedir_Numeros is
   N : Integer;
begin
   loop
      Put ("Introduce un número (0 para salir): ");
      Get (N);
      exit when N = 0;
      Put_Line ("Número insertado: " & Integer'Image (N));
   end loop;
   Put_Line ("Fin del programa.");
end Pedir_Numeros;
