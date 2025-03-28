with Ada.Text_IO; use Ada.Text_IO;
procedure Cuenta_Regresiva is
N : Integer := 5;
begin
while N > 0 loop
Put_Line("Contando: " & Integer'Image(N));
N := N - 1;
end loop;
end Cuenta_Regresiva;