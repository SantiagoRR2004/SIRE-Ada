with Ada.Text_IO;       use Ada.Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;
procedure Operaciones is
   A, B : Float;
   function Leer_Float (Mensaje : String) return Float is
      Valor : Float;
   begin
      loop
         Put (Mensaje);
         begin
            Get (Valor);
            return Valor;
         exception
            when Data_Error =>
               Put_Line
                 ("Entrada inválida. Por favor, introduce un número válido.");
               Skip_Line;
         end;
      end loop;
   end Leer_Float;

begin
   A := Leer_Float ("Introduce el primer número: ");
   B := Leer_Float ("Introduce el segundo número: ");
   Put ("Suma: ");
   Put (A + B, Fore => 1, Aft => 2, Exp => 0);
   New_Line;
   Put ("Resta: ");
   Put (A - B, Fore => 1, Aft => 2, Exp => 0);
   New_Line;
   Put ("Multiplicación: ");
   Put (A * B, Fore => 1, Aft => 2, Exp => 0);
   New_Line;
   if B /= 0.0 then
      Put ("División: ");
      Put (A / B, Fore => 1, Aft => 2, Exp => 0);
      New_Line;
   else
      Put_Line ("Error: División por cero no permitida.");
   end if;
end Operaciones;
