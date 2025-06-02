with Ada.Text_IO;         use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure Numeros_Pares is
   Inicio, Fin, Temp : Integer;
begin
   Put ("Introduce el inicio del rango: ");
   Get (Inicio);
   Put ("Introduce el fin del rango: ");
   Get (Fin);

   if Inicio > Fin then
      Put_Line ("El inicio debe ser menor o igual que el fin.");
      Temp := Inicio;
      Inicio := Fin;
      Fin := Temp;
   end if;

   for I in reverse Inicio .. Fin loop
      if I mod 2 = 0 then
         Put_Line (Integer'Image (I));
      end if;
   end loop;
end Numeros_Pares;
