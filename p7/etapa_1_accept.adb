with Ada.Text_IO;      use Ada.Text_IO;
with Buffer_Interface; use Buffer_Interface;
with Main;

procedure Etapa_1_Accept is

   task type Buffer is
     new IBuffer
   with
      entry Insertar (D : Integer);
      entry Extraer (D : out Integer);
   end Buffer;

   task body Buffer is
      Dato : Integer := 0;
   begin
      loop
         accept Insertar (D : in Integer) do
            Dato := D;
            Put_Line ("Insertado " & Integer'Image (D));
         end Insertar;
         accept Extraer (D : out Integer) do
            D := Dato;
            Dato := 0;
            Put_Line ("Extraído " & Integer'Image (D));
         end Extraer;
      end loop;
   end Buffer;

   B : aliased Buffer;

begin
   Put_Line ("=== Etapa 1: Accept sin control de estado ===");
   Main.runBuffer (B'Access);
   delay 6.0;
end Etapa_1_Accept;
