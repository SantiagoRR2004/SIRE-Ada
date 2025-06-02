with Ada.Text_IO; use Ada.Text_IO;

procedure Ejemplo_Tarea is
   task Escritor;
   task body Escritor is
   begin
      for I in 1 .. 5 loop
         Put_Line ("Hola desde la tarea");
         delay 1.5;
      end loop;
   end Escritor;
begin
   Put_Line ("Hola desde el programa principal");
--  delay 3.0; -- Esperamos a que la tarea termine
end Ejemplo_Tarea;
