with Ada.Text_IO;           use Ada.Text_IO;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
procedure Registro_Alumno is
    type Alumno is record
        Nombre       : Unbounded_String;
        Edad         : Integer;
        Calificacion : Float;
    end record;
    Estudiante : Alumno;
begin
    Estudiante :=
       (Nombre       => To_Unbounded_String ("Juan Perez"), Edad => 20,
        Calificacion => 9.5);
    Put_Line ("Nombre: " & To_String (Estudiante.Nombre));
    Put_Line ("Edad: " & Integer'Image (Estudiante.Edad));
    Put_Line ("Calificaci´on: " & Float'Image (Estudiante.Calificacion));
end Registro_Alumno;
