with Ada.Text_IO;      use Ada.Text_IO;
with Buffer_Interface; use Buffer_Interface;
with Main;

procedure Etapa_1_Accept is

   task type Buffer is
     new IBuffer
   with
      entry Insertar (I : Integer);
      entry Extraer (I : out Integer);
   end Buffer;

   task body Buffer is
      Dato : Integer := 0;
   begin
      loop
         accept Insertar (I : in Integer) do
            Dato := I;
            Put_Line ("Insertado " & Integer'Image (I));
         end Insertar;
         accept Extraer (I : out Integer) do
            I := Dato;
            Dato := 0;
            Put_Line ("Extraído " & Integer'Image (I));
         end Extraer;
      end loop;
   end Buffer;

   B : aliased Buffer;

begin
   Put_Line ("=== Etapa 1: Accept sin control de estado ===");
   Main.runBuffer (B'Access);
   delay 6.0;
end Etapa_1_Accept;
