with Ada.Text_IO; use Ada.Text_IO;

procedure Buffer_Protegido is
   protected Buffer is
      entry Insertar (D : in Integer);
      entry Extraer (D : out Integer);
   private
      Dato : Integer := 0; -- Buffer inicialmente vacío
   end Buffer;

   protected body Buffer is
      entry Insertar (D : in Integer) when Dato = 0 is
      begin
         Dato := D;
         Put_Line ("Insertado " & Integer'Image (D));
      end Insertar;

      entry Extraer (D : out Integer) when Dato /= 0 is
      begin
         D := Dato;
         Dato := 0; -- Limpiamos el buffer
         Put_Line ("Extraído " & Integer'Image (D));
      end Extraer;
   end Buffer;

   task type Productor;
   task type Consumidor;

   task body Productor is
   begin
      delay 0.5;
      for I in 1 .. 3 loop
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
   Put_Line ("=== Ejercicio 2: Buffer protegido ===");
   delay
     2.0; -- Para permitir que las tareas Productor y Consumidor trabajen un poco
end Buffer_Protegido;
