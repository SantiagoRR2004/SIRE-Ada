with Ada.Text_IO; use Ada.Text_IO;
procedure Multitareas is
task type Mensajeador(Id : Integer);
task body Mensajeador is
begin
for I in 1 .. 3 loop
Put_Line("Tarea " & Integer'Image(Id) & " -> " & Integer'Image(I));
delay 0.3 * Id;
end loop;
end Mensajeador;
T1 : Mensajeador(1);
T2 : Mensajeador(2);
T3 : Mensajeador(3);
begin
Put_Line("Inicio del programa principal");
delay 2.0;
end Multitareas;