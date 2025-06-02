with Ada.Text_IO;         use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure Lista_Numeros is
   type Lista is array (1 .. 5) of Integer;
   Numeros : Lista;

   function Suma (L : Lista) return Integer is
      Suma : Integer := 0;
   begin
      for I in L'Range loop
         Suma := Suma + L (I);
      end loop;
      return Suma;
   end Suma;

begin
   for I in Numeros'Range loop
      Put ("Introduce el número de la posición" & Integer'Image (I) & ": ");
      Get (Numeros (I));
   end loop;

   for I in Numeros'Range loop
      Put_Line
        ("El número que está en la posición "
         & Integer'Image (I)
         & " es: "
         & Integer'Image (Numeros (I)));
   end loop;

   Put_Line ("La suma de los elementos es:" & Integer'Image (Suma (Numeros)));
end Lista_Numeros;
