with Ada.Text_IO; use Ada.Text_IO;

procedure Etapa_5_Term_Temp_Guarda_Select_Accept is
   task type Buffer is
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
   B : Buffer; -- Instanciamos el buffer
   task type Productor;
   task type Consumidor;
   task body Productor is
   begin
      for I in 1 .. 3 loop
         delay 1.5;
         B.Insertar (I); -- Intenta insertar un valor en el buffer
      end loop;
   end Productor;
   task body Consumidor is
      V : Integer;
   begin
      for I in 1 .. 3 loop
         delay 1.5;
         B.Extraer (V); -- Intenta extraer un valor del buffer
      end loop;
   end Consumidor;
   P : Productor; -- Instancia de la tarea Productor
   C : Consumidor; -- Instancia de la tarea Consumidor
begin
   Put_Line
     ("=== Etapa 5: Term + Temp + Guarda + Select + Accept con control de estado ===");
   delay
     6.0; -- Para permitir que las tareas Productor y Consumidor trabajen un poco
end Etapa_5_Term_Temp_Guarda_Select_Accept;
