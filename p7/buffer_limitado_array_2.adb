with Ada.Text_IO; use Ada.Text_IO;

procedure Buffer_Limitado_Array is
   type Buffer_Array is array (1 .. 5) of Integer;
   task type Buffer is
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
   B : Buffer; -- Instanciamos el buffer
   task type Productor;
   task type Consumidor;
   task body Productor is
   begin
      delay 1.5;
      for I in 1 .. 3 loop
         B.Insertar (I); -- Intenta insertar un valor en el buffer
      end loop;
   end Productor;
   task body Consumidor is
      V : Integer;
   begin
      delay 1.5;
      for I in 1 .. 3 loop
         B.Extraer (V); -- Intenta extraer un valor del buffer
      end loop;
   end Consumidor;
   P : Productor; -- Instancia de la tarea Productor
   C : Consumidor; -- Instancia de la tarea Consumidor
begin
   Put_Line ("=== Ejercicio 3.2: Buffer con array ===");
   delay
     6.0; -- Para permitir que las tareas Productor y Consumidor trabajen un poco
end Buffer_Limitado_Array;
