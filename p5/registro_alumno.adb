with Ada.Text_IO;           use Ada.Text_IO;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Text_IO.Unbounded_IO;
with Ada.Integer_Text_IO;
with Ada.Float_Text_IO;
procedure Registro_Alumno is
    type Alumno is record
        Nombre       : Unbounded_String;
        Edad         : Integer;
        Calificacion : Float;
    end record;
    Estudiante : Alumno;
begin
    Put("Introduce el nombre del estudiante: ");
    Ada.Text_IO.Unbounded_IO.Get_Line(Estudiante.Nombre);
    Put("Introduce la edad del estudiante: ");
    Ada.Integer_Text_IO.Get(Estudiante.Edad);
    Put("Introduce la calificación del estudiante: ");
    Ada.Float_Text_IO.Get(Estudiante.Calificacion);
    Put_Line ("Nombre: " & To_String (Estudiante.Nombre));
    Put_Line ("Edad: " & Integer'Image (Estudiante.Edad));
    Put_Line ("Calificaci´on: " & Float'Image (Estudiante.Calificacion));
end Registro_Alumno;
