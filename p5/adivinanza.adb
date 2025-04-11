with Ada.Text_IO;         use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Numerics.Float_Random;

procedure Adivinanza is
   -- Definimos un tipo que es un entero entre 1 y 100
   subtype Int1_100 is Positive range 1 .. 100;

   Rand      : Ada.Numerics.Float_Random.Generator;
   Aleatorio : Int1_100;
   Intentos  : Integer := 0;
   Respuesta : Int1_100;
begin
   Ada.Numerics.Float_Random.Reset (Rand);

   Aleatorio := Int1_100 (Ada.Numerics.Float_Random.Random (Rand) * 100.0) + 1;

   Put_Line ("El número a adivinar está entre 1 y 100.");

   -- Bucle para pedir los intentos del usuario
   loop
      Intentos := Intentos + 1;

      Put ("¿Qué número crees que es? ");
      loop
         begin
            Get (Respuesta);
            exit;
         exception
            when others =>
               Put_Line ("Error. Por favor, introduce un número válido:");
               Skip_Line;
         end;
      end loop;

      if Respuesta = Aleatorio then
         Put_Line ("¡Felicidades! Has adivinado el número.");
         Put_Line ("Número de intentos: " & Integer'Image (Intentos));
         exit;
      elsif Respuesta < Aleatorio then
         Put_Line ("El número es mayor.");
      else
         Put_Line ("El número es menor.");
      end if;
   end loop;
end Adivinanza;
