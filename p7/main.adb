with Ada.Text_IO;      use Ada.Text_IO;
with Buffer_Interface; use Buffer_Interface;

package body Main is

   procedure runBuffer (B : access IBuffer'Class) is

      task type Productor (B : access IBuffer'Class);

      task body Productor is
      begin
         for I in 1 .. 3 loop
            delay 1.0;
            B.Insertar (I);
         end loop;
      end Productor;

      task type Consumidor (B : access IBuffer'Class);

      task body Consumidor is
         V : Integer;
      begin
         for I in 1 .. 3 loop
            delay 1.5;
            B.Extraer (V);
         end loop;
      end Consumidor;

      -- Instanciar los productores y consumidores
      P : Productor (B);
      C : Consumidor (B);

   begin
      delay 6.0;
   end runBuffer;

end Main;
