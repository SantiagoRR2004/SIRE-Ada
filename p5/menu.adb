with Ada.Text_IO; use Ada.Text_IO;
procedure Menu is
Opcion : Character;
begin
   Put_Line("Menú:");
   Put_Line("a) Saludar");
   Put_Line("b) Decir adiós");
   Put_Line("c) Salir");
   Put("Elige una opción: ");
   Get(Opcion);
   case Opcion is
      when 'a' => Put_Line("¡Hola!");
      when 'b' => Put_Line("¡Adiós!");
      when others => Put_Line("Opción no válida.");
   end case;
end Menu;