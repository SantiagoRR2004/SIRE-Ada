with Ada.Text_IO; use Ada.Text_IO;

procedure Buffer_Protegido_array is
   type Buffer_Array is array (1 .. 5) of Integer;
   protected Buffer is
      entry Insertar (D : in Integer);
      entry Extraer (D : out Integer);
   private
      Dato     : Buffer_Array := (others => 0); -- Buffer inicialmente vacío
      Contador : Integer := 0; -- Contador de elementos en el buffer
      Inicio   : Integer := 1; -- Índice para extraer
      Fin      : Integer := 1; -- Índice para insertar
   end Buffer;

   protected body Buffer is
      entry Insertar (D : in Integer) when Contador < 5 is
      begin
         Dato (Fin) := D;
         Fin :=
           Fin
           mod 5
           + 1; -- Actualizamos el índice de inserción de manera circular
         Contador := Contador + 1; -- Incrementamos el contador
         Put_Line ("Insertado " & Integer'Image (D));
      end Insertar;

      entry Extraer (D : out Integer) when Contador > 0 is
      begin
         D := Dato (Inicio);
         Inicio :=
           Inicio
           mod 5
           + 1; -- Actualizamos el índice de extracción de manera circular
         Contador := Contador - 1; -- Decrementamos el contador
         Put_Line ("Extraído " & Integer'Image (D));
      end Extraer;
   end Buffer;

   task type Productor;
   task type Consumidor;

   task body Productor is
   begin
      delay 0.5;
      for I in 1 .. 9 loop
         Buffer.Insertar (I); -- Intenta insertar un valor en el buffer
      end loop;
   end Productor;

   task body Consumidor is
      V : Integer;
   begin
      delay 0.5;
      for I in 1 .. 3 loop
         Buffer.Extraer (V); -- Intenta extraer un valor del buffer
      end loop;
   end Consumidor;

   P : Productor; -- Instancia de la tarea Productor
   C : Consumidor; -- Instancia de la tarea Consumidor

begin
   Put_Line ("=== Ejercicio 4: Buffer protegido array ===");
   delay
     4.0; -- Para permitir que las tareas Productor y Consumidor trabajen un poco
end Buffer_Protegido_array;
