with Ada.Text_IO; use Ada.Text_IO;

procedure Etapa_1_Accept is
   task type Buffer is
      entry Insertar (D : in Integer);
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
            Put_Line ("Extra´ıdo " & Integer'Image (D));
         end Extraer;
      end loop;
   end Buffer;
   B : Buffer;
   task type Productor;
   task type Consumidor;
   task body Productor is
   begin
      for I in 1 .. 3 loop
         delay 1.0;
         B.Insertar (I);
      end loop;
   end Productor;
   task body Consumidor is
      V : Integer;
   begin
      for I in 1 .. 3 loop
         delay 1.5;
         B.Extraer (V);
      end loop;
   end Consumidor;
   P : Productor;
   C : Consumidor;
begin
   Put_Line ("=== Etapa 1: Accept sin control de estado ===");
   delay 6.0;
end Etapa_1_Accept;
