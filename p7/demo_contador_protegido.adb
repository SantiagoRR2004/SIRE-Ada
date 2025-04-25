with Ada.Text_IO; use Ada.Text_IO;

procedure Demo_Contador_Protegido is
   protected Contador_Protegido is
      procedure Incrementar;
      function Valor return Integer;
   private
      C : Integer := 0;
   end Contador_Protegido;
   protected body Contador_Protegido is
      procedure Incrementar is
      begin
         C := C + 1;
      end Incrementar;
      function Valor return Integer is
      begin
         return C;
      end Valor;
   end Contador_Protegido;
   task type Trabajadora;
   task body Trabajadora is
   begin
      for I in 1 .. 10 loop
         delay 0.1;
         Contador_Protegido.Incrementar;
      end loop;
   end Trabajadora;
   T1, T2, T3 : Trabajadora;
begin
   Put_Line ("Iniciando tareas...");
   delay 2.0; -- Esperamos a que las tareas terminen
   Put_Line
     ("Valor final del contador: " & Integer'Image (Contador_Protegido.Valor));
end Demo_Contador_Protegido;
