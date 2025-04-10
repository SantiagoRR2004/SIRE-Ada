with Ada.Text_IO;       use Ada.Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;
procedure Operaciones is
   A, B : Float;
begin
   Put ("Introduce el primer número: ");
   Get (A);
   Put ("Introduce el segundo número: ");
   Get (B);
   Put ("Suma: ");
   Put (A + B, Fore => 1, Aft => 2, Exp => 0);
   New_Line;
   Put ("Resta: ");
   Put (A - B, Fore => 1, Aft => 2, Exp => 0);
   New_Line;
   Put ("Multiplicación: ");
   Put (A * B, Fore => 1, Aft => 2, Exp => 0);
   New_Line;
   Put ("División: ");
   Put (A / B, Fore => 1, Aft => 2, Exp => 0);
   New_Line;
end Operaciones;
