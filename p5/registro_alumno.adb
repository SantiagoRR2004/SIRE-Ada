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
   type Alumnos_Array is array (1 .. 5) of Alumno;
   Estudiante : Alumno;
   Contactos  : Alumnos_Array :=
     (1 =>
        (Nombre       => To_Unbounded_String ("Manolo"),
         Edad         => 20,
         Calificacion => 8.5),
      2 =>
        (Nombre       => To_Unbounded_String ("Ana"),
         Edad         => 22,
         Calificacion => 9.0),
      3 =>
        (Nombre       => To_Unbounded_String ("Luis"),
         Edad         => 21,
         Calificacion => 7.5),
      4 =>
        (Nombre       => To_Unbounded_String ("Maria"),
         Edad         => 23,
         Calificacion => 8.0),
      5 => Estudiante);
begin
   Put ("Introduce el nombre del estudiante: ");
   Ada.Text_IO.Unbounded_IO.Get_Line (Estudiante.Nombre);
   Put ("Introduce la edad del estudiante: ");
   Ada.Integer_Text_IO.Get (Estudiante.Edad);
   Put ("Introduce la calificación del estudiante: ");
   Ada.Float_Text_IO.Get (Estudiante.Calificacion);

   for S in Contactos'Range loop
      Put_Line ("Nombre: " & To_String (Contactos (S).Nombre));
      Put_Line ("Edad: " & Integer'Image (Contactos (S).Edad));
      Put_Line ("Calificación: " & Float'Image (Contactos (S).Calificacion));
   end loop;
end Registro_Alumno;
