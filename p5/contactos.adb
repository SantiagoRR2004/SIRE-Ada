with Ada.Text_IO;         use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure Registro_Contactos is
   -- Definición de tipos
   type Contacto is record
      Nombre   : String (1 .. 10);
      Email    : String (1 .. 20);
      Telefono : String (1 .. 10);
   end record;

   type Contacto_Array is array (1 .. 10) of Contacto;
   Contactos     : Contacto_Array;
   Num_Contactos : Integer := 0;

   Opcion : Character;

   -- Función para pedir datos de un contacto nuevo
   function Pedir_Datos_Contacto return Contacto is
      Nombre   : String (1 .. 10);
      Email    : String (1 .. 20);
      Telefono : String (1 .. 10);
      Input    : String (1 .. 100);
      Len      : Natural;
   begin
      Put ("Nombre (máx 10): ");
      Get_Line (Input, Len);
      Nombre := (others => ' ');
      for I in 1 .. Integer'Min (Len, 10) loop
         Nombre (I) := Input (I);
      end loop;

      Put ("Email (máx 20): ");
      Get_Line (Input, Len);
      Email := (others => ' ');
      for I in 1 .. Integer'Min (Len, 20) loop
         Email (I) := Input (I);
      end loop;

      Put ("Telefono (máx 10): ");
      Get_Line (Input, Len);
      Telefono := (others => ' ');
      for I in 1 .. Integer'Min (Len, 10) loop
         Telefono (I) := Input (I);
      end loop;

      return (Nombre => Nombre, Email => Email, Telefono => Telefono);
   end Pedir_Datos_Contacto;

   -- Añadir contacto
   procedure Anadir_Contacto (Cont : Contacto) is
   begin
      if Num_Contactos < 10 then
         Num_Contactos := Num_Contactos + 1;
         Contactos (Num_Contactos) := Cont;
      else
         Put_Line ("Agenda llena.");
      end if;
   end Anadir_Contacto;

   -- Buscar contacto
   function Buscar_Contacto (Nombre_Buscar : String) return Contacto is
      Result : Contacto :=
        (Nombre   => (others => ' '),
         Email    => (others => ' '),
         Telefono => (others => ' '));
   begin
      for I in 1 .. Num_Contactos loop
         if Contactos (I).Nombre = Nombre_Buscar (1 .. 10) then
            return Contactos (I);
         end if;
      end loop;
      return Result;
   end Buscar_Contacto;

   -- Imprimir contacto
   procedure Imprimir_Contacto (Cont : Contacto) is
   begin
      Put_Line ("Nombre:   " & Cont.Nombre);
      Put_Line ("Email:    " & Cont.Email);
      Put_Line ("Telefono: " & Cont.Telefono);
   end Imprimir_Contacto;

   -- Mostrar todos los contactos
   procedure Mostrar_Contactos is
   begin
      for I in 1 .. Num_Contactos loop
         Imprimir_Contacto (Contactos (I));
         New_Line;
      end loop;
   end Mostrar_Contactos;

   -- Variables auxiliares
   Nombre_Buscar : String (1 .. 10);
   Input         : String (1 .. 100);
   Len           : Natural;
   Cont          : Contacto;

begin
   loop
      Put_Line ("Menú:");
      Put_Line ("a) Añadir contacto");
      Put_Line ("b) Buscar contacto por nombre");
      Put_Line ("c) Mostrar todos los contactos");
      Put_Line ("d) Salir");
      Put ("Elige una opción: ");
      Get (Opcion);
      Skip_Line;

      case Opcion is
         when 'a' =>
            Cont := Pedir_Datos_Contacto;
            Anadir_Contacto (Cont);

         when 'b' =>
            Put ("Nombre a buscar: ");
            Get_Line (Input, Len);
            Nombre_Buscar := (others => ' ');
            for I in 1 .. Integer'Min (Len, 10) loop
               Nombre_Buscar (I) := Input (I);
            end loop;
            Cont := Buscar_Contacto (Nombre_Buscar);
            Imprimir_Contacto (Cont);

         when 'c' =>
            Mostrar_Contactos;

         when 'd' =>
            exit;

         when others =>
            Put_Line ("Opción no válida.");
      end case;

      New_Line;
   end loop;
end Registro_Contactos;
