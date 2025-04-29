with Ada.Text_IO;      use Ada.Text_IO;
with Buffer_Interface; use Buffer_Interface;
with Main;

procedure Buffer_Limitado_Array is

   type Buffer_Array is array (1 .. 5) of Integer;

   task type Buffer is
     new IBuffer
   with
      entry Insertar (D : in Integer);
      entry Extraer (D : out Integer);
   end Buffer;

   task body Buffer is
      Dato     : Buffer_Array := (others => 0); -- Buffer inicialmente vacío
      Contador : Integer := 0; -- Contador de elementos en el buffer
      Inicio   : Integer := 1; -- Índice para extraer
      Fin      : Integer := 1; -- Índice para insertar
   begin
      loop
         select
            when Contador < 5
            =>
            -- Solo se puede insertar cuando el buffer está vacío (Dato = 0)
            accept Insertar (D : in Integer) do
               Dato (Fin) := D;
               Fin :=
                 Fin
                 mod 5
                 + 1; -- Actualizamos el índice de inserción de manera circular
               Contador := Contador + 1; -- Incrementamos el contador
               Put_Line ("Insertado " & Integer'Image (D));
            end Insertar;
         or
            when Contador > 0
            =>
            -- Solo se puede extraer cuando el buffer no está vacío (Dato != 0)
            accept Extraer (D : out Integer) do
               D := Dato (Inicio);
               Inicio :=
                 Inicio
                 mod 5
                 + 1; -- Actualizamos el índice de extracción de manera circular
               Contador := Contador - 1; -- Decrementamos el contador
               Put_Line ("Extraído " & Integer'Image (D));
            end Extraer;
         end select;
      end loop;
   end Buffer;

   B : aliased Buffer; -- Instanciamos el buffer

begin
   Put_Line ("=== Ejercicio 3.3: Buffer con array ===");
   Main.runBuffer (B'Access);
   delay
     6.0; -- Para permitir que las tareas Productor y Consumidor trabajen un poco
end Buffer_Limitado_Array;
