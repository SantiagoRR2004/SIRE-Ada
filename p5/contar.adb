with Ada.Text_IO; use Ada.Text_IO;

procedure Contar is
begin
   for I in 1 .. 5 loop
      Put_Line ("Número: " & Integer'Image (I));
   end loop;
end Contar;
