package Common is

   type Estado_Tipo is record
      Hay_Obstaculo : Boolean := False;
      Camino_Libre  : Boolean := False;
      Bateria_Baja  : Boolean := False;
      Enemigo       : Boolean := False;
   end record;

   function Leer_Sensores return Estado_Tipo;

end Common;
