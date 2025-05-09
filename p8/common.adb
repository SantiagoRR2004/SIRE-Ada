with Ada.Numerics.Float_Random;

package body Common is

   G : Ada.Numerics.Float_Random.Generator;

   function Random_Bool return Boolean is
   begin
      Ada.Numerics.Float_Random.Reset (G);
      return Ada.Numerics.Float_Random.Random (G) >= 0.5;
   end Random_Bool;

   function Leer_Sensores return Estado_Tipo is
   begin
      return
        (Hay_Obstaculo => Random_Bool,
         Camino_Libre  => Random_Bool,
         Bateria_Baja  => Random_Bool,
         Enemigo       => Random_Bool);
   end Leer_Sensores;

end Common;
