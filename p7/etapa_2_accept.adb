with Ada.Text_IO;      use Ada.Text_IO;
with Buffer_Interface; use Buffer_Interface;
with Main;

procedure Etapa_2_Select_Accept is

   task type Buffer is
     new IBuffer
   with
      entry Insertar (D : in Integer);
      entry Extraer (D : out Integer);
   end Buffer;

   task body Buffer is
      Dato : Integer := 0;
   begin
      loop
         select
            accept Insertar (D : in Integer) do
               Dato := D;
               Put_Line ("Insertado " & Integer'Image (D));
            end Insertar;
         or
            accept Extraer (D : out Integer) do
               D := Dato;
               Dato := 0;
               Put_Line ("Extraído " & Integer'Image (D));
            end Extraer;
         end select;
      end loop;
   end Buffer;

   B : aliased Buffer;

begin
   Put_Line ("=== Etapa 2: Select + Accept sin control de estado ===");
   Main.runBuffer (B'Access);
   delay 6.0;
end Etapa_2_Select_Accept;
