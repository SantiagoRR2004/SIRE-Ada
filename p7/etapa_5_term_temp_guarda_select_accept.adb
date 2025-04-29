with Ada.Text_IO;      use Ada.Text_IO;
with Buffer_Interface; use Buffer_Interface;
with Main;

procedure Etapa_5_Term_Temp_Guarda_Select_Accept is

   task type Buffer is
     new IBuffer
   with
      entry Insertar (D : in Integer);
      entry Extraer (D : out Integer);
   end Buffer;

   task body Buffer is
      Dato : Integer := 0; -- Buffer inicialmente vacío
   begin
      loop
         select
            when Dato = 0
            =>
            -- Solo se puede insertar cuando el buffer está vacío (Dato = 0)
            accept Insertar (D : in Integer) do
               Dato := D;
               Put_Line ("Insertado " & Integer'Image (D));
            end Insertar;
         or
            when Dato /= 0
            =>
            -- Solo se puede extraer cuando el buffer no está vacío (Dato != 0)
            accept Extraer (D : out Integer) do
               D := Dato;
               Dato := 0;
               Put_Line ("Extraído " & Integer'Image (D));
            end Extraer;
         or
            -- Terminamos cuando ambas tareas han completado su trabajo
            terminate; -- Aquí se termina de inmediato
         end select;
      end loop;
   end Buffer;

   B : aliased Buffer; -- Instanciamos el buffer

begin
   Put_Line
     ("=== Etapa 5: Term + Temp + Guarda + Select + Accept con control de estado ===");
   Main.runBuffer (B'Access);
   delay
     6.0; -- Para permitir que las tareas Productor y Consumidor trabajen un poco
end Etapa_5_Term_Temp_Guarda_Select_Accept;
