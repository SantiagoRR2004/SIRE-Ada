with Ada.Text_IO;         use Ada.Text_IO;
with Ada.Float_Text_IO;   use Ada.Float_Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure Estadisticas is

   type Float_Array is array (Positive range <>) of Float;
   type Float_Array_Access is access all Float_Array;

   -- Función para leer un número flotante con validación
   function Leer_Numero return Float is
      Valor : Float;
   begin
      loop
         begin
            Get (Valor);
            exit;
         exception
            when Data_Error =>
               Put_Line ("Error. Por favor, introduce un número válido:");
               Skip_Line;
         end;
      end loop;
      return Valor;
   end Leer_Numero;

   -- Funciones estadísticas
   function Calcular_Minimo (A : Float_Array) return Float is
      Min : Float := A (A'First);
   begin
      for I in A'Range loop
         if A (I) < Min then
            Min := A (I);
         end if;
      end loop;
      return Min;
   end Calcular_Minimo;

   function Calcular_Maximo (A : Float_Array) return Float is
      Max : Float := A (A'First);
   begin
      for I in A'Range loop
         if A (I) > Max then
            Max := A (I);
         end if;
      end loop;
      return Max;
   end Calcular_Maximo;

   function Calcular_Media (A : Float_Array) return Float is
      Suma : Float := 0.0;
   begin
      for I in A'Range loop
         Suma := Suma + A (I);
      end loop;
      return Suma / Float (A'Length);
   end Calcular_Media;

   function Calcular_Varianza (A : Float_Array) return Float is
      Media          : Float := Calcular_Media (A);
      Suma_Cuadrados : Float := 0.0;
   begin
      for I in A'Range loop
         Suma_Cuadrados := Suma_Cuadrados + (A (I) - Media)**2;
      end loop;
      return Suma_Cuadrados / Float (A'Length);
   end Calcular_Varianza;

   -- Variables
   N       : Natural;
   Valores : Float_Array_Access;

begin
   Put_Line ("¿De cuántos números será la lista?");
   loop
      begin
         Get (N);
         if N > 0 then
            exit;
         else
            Put_Line ("Por favor, introduzca un número válido mayor que 0.");
         end if;
      exception
         when CONSTRAINT_ERROR =>
            Put_Line ("Error. El número debe ser mayor que 0.");
            Skip_Line;
         when Data_Error =>
            Put_Line ("Error. Debe ser un número entero.");
            Skip_Line;
         when others =>
            Put_Line ("Error desconocido.");
            Skip_Line;
      end;
   end loop;

   Valores := new Float_Array (1 .. N);

   Put_Line ("Ingrese los " & Integer'Image (N) & " números:");

   for I in Valores'Range loop
      Put ("Número " & Integer'Image (I) & ": ");
      Valores (I) := Leer_Numero;
   end loop;

   -- Mostrar resultados
   Put_Line ("Estadísticas calculadas:");
   Put_Line ("Mínimo: ");
   Put (Calcular_Minimo (Valores.all), Fore => 1, Aft => 2, Exp => 0);
   New_Line;
   Put_Line ("Máximo: ");
   Put (Calcular_Maximo (Valores.all), Fore => 1, Aft => 2, Exp => 0);
   New_Line;
   Put_Line ("Media: ");
   Put (Calcular_Media (Valores.all), Fore => 1, Aft => 2, Exp => 0);
   New_Line;
   Put_Line ("Varianza: ");
   Put (Calcular_Varianza (Valores.all), Fore => 1, Aft => 2, Exp => 0);
   New_Line;

end Estadisticas;
