with Ada.Text_IO;           use Ada.Text_IO;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Common;

procedure Robot_Jerarquico is

   -- Nuevo Tipo misión para más alto nivel
   type Mision_tipo is (Explorar, Defender, Recargar, Ninguna);

   -- Cambiar Meta_Tipo a un array de metas
   type Meta_Tipo is
     (Evitar_Obstaculo,
      Cargar_Bateria,
      Moverse,
      Disparar,
      Recargar_Balas,
      Ninguna);

   -- Usar un array de metas
   type Metas_Array is array (1 .. 4) of Meta_Tipo;

   type Accion_Tupla is record
      Nombre    : Unbounded_String;
      Prioridad : Integer;
   end record;

   Max_Acciones : constant Integer := 5;
   type Acciones_Array is array (1 .. Max_Acciones) of Accion_Tupla;

   protected type Acciones_Protegidas is
      procedure Guardar (Acciones : in Acciones_Array);
      procedure Obtener (Acciones : out Acciones_Array);
      procedure Resetear;
   private
      Internas : Acciones_Array :=
        (others => (To_Unbounded_String ("Esperar"), 0));
   end Acciones_Protegidas;

   protected body Acciones_Protegidas is
      procedure Guardar (Acciones : in Acciones_Array) is
      begin
         Internas := Acciones;
      end Guardar;

      procedure Obtener (Acciones : out Acciones_Array) is
         Temp : Acciones_Array := Internas;
         Tmp  : Accion_Tupla;
      begin
         for I in Temp'First .. Temp'Last - 1 loop
            for J in I + 1 .. Temp'Last loop
               if Temp (J).Prioridad > Temp (I).Prioridad then
                  Tmp := Temp (I);
                  Temp (I) := Temp (J);
                  Temp (J) := Tmp;
               end if;
            end loop;
         end loop;
         Acciones := Temp;
      end Obtener;

      procedure Resetear is
      begin
         for I in Internas'Range loop
            Internas (I) := (To_Unbounded_String ("Esperar"), 0);
         end loop;
      end Resetear;
   end Acciones_Protegidas;

   -- Planificador estratégico mision
   task type Planificador_Estrategico_Alto_Nivel is
      entry Obtener_Mision
        (Estado : in Common.Estado_Tipo; Mision : out Mision_tipo);
   end Planificador_Estrategico_Alto_Nivel;

   task body Planificador_Estrategico_Alto_Nivel is
   begin
      loop
         select
            accept Obtener_Mision
              (Estado : in Common.Estado_Tipo; Mision : out Mision_tipo)
            do
               -- Inicializamos la misión en "Ninguna"
               Mision := Ninguna;

               -- Asignamos la misión según el estado del robot
               if Estado.Enemigo then
                  Mision := Defender;
               elsif Estado.Bateria_Baja then
                  Mision := Recargar;
               else
                  Mision := Explorar;
               end if;

            end Obtener_Mision;
         or
            terminate;
         end select;
      end loop;
   end Planificador_Estrategico_Alto_Nivel;

   task type Planificador_Estrategico is
      entry Evaluar
        (Mision : in Mision_Tipo;
         Estado : in Common.Estado_Tipo;
         Balas  : in Integer;
         Metas  : out Metas_Array);
   end Planificador_Estrategico;

   task body Planificador_Estrategico is
   begin
      loop
         select
            accept Evaluar
              (Mision : in Mision_Tipo;
               Estado : in Common.Estado_Tipo;
               Balas  : in Integer;
               Metas  : out Metas_Array)
            do
               -- Comenzamos con las metas vacías
               Metas :=
                 (Ninguna,
                  Ninguna,
                  Ninguna,
                  Ninguna);  -- Inicializamos las metas en "Ninguna"

               case Mision is
                  when Explorar =>
                     if Estado.Camino_Libre then
                        Metas (1) := Moverse;
                     end if;

                  when Defender =>
                     if Estado.Enemigo then
                        Metas (1) := Disparar;
                     end if;
                     if Balas = 0 then
                        Metas (2) := Recargar_Balas;
                     end if;

                  when Recargar =>
                     if Estado.Bateria_Baja then
                        Metas (1) := Cargar_Bateria;
                     end if;
                     --- Después de cargar, podemos explorar
                     if Estado.Camino_Libre then
                        Metas (2) := Moverse;
                     end if;

                  when others =>
                     null;
               end case;

               -- Metas reactivas que pueden superponerse a la misión
               if Estado.Hay_Obstaculo then
                  Metas (4) := Evitar_Obstaculo;
               end if;

            end Evaluar;
         or
            terminate;
         end select;
      end loop;
   end Planificador_Estrategico;

   task type Planificador_Tactico (Acc : access Acciones_Protegidas) is
      entry Planear (Metas : in Metas_Array; Estado : in Common.Estado_Tipo);
   end Planificador_Tactico;

   task body Planificador_Tactico is
      Acciones : Acciones_Array :=
        (others => (To_Unbounded_String ("Esperar"), 0));
   begin
      loop
         select
            accept Planear
              (Metas : in Metas_Array; Estado : in Common.Estado_Tipo)
            do
               Acciones := (others => (To_Unbounded_String ("Esperar"), 0));

               for I in Metas'Range loop
                  case Metas (I) is
                     when Cargar_Bateria =>
                        if Estado.Bateria_Baja then
                           Acciones (1) := (To_Unbounded_String ("Cargar"), 3);
                        end if;

                     when Evitar_Obstaculo =>
                        if Estado.Hay_Obstaculo then
                           Acciones (2) := (To_Unbounded_String ("Girar"), 5);
                        end if;

                     when Moverse =>
                        if Estado.Camino_Libre and not Estado.Bateria_Baja then
                           Acciones (3) :=
                             (To_Unbounded_String ("Avanzar"), 1);
                        end if;

                     when Disparar =>
                        if Estado.Enemigo then
                           Acciones (4) :=
                             (To_Unbounded_String
                                ("Disparar"
                                 & Integer'Image (Estado.TipoEnemigo)),
                              10);
                        end if;

                     when Recargar_Balas =>
                        Acciones (5) :=
                          (To_Unbounded_String ("Recargar_Balas"), 11);

                     when others =>
                        null;
                  end case;
               end loop;

               Acc.all.Guardar (Acciones);
            end Planear;
         or
            terminate;
         end select;
      end loop;
   end Planificador_Tactico;

   Acc  : aliased Acciones_Protegidas;
   PEAN : Planificador_Estrategico_Alto_Nivel;
   PE   : Planificador_Estrategico;
   PT   : Planificador_Tactico (Acc'Access);

   task Avanzar is
      --pragma Priority(10);
      entry Ejecutar;
   end Avanzar;

   task body Avanzar is
   begin
      loop
         select
            accept Ejecutar do
               Put_Line ("Ejecutando: Avanzar");
               delay 1.0;
            end Ejecutar;
         or
            terminate;
         end select;
      end loop;
   end Avanzar;

   task Girar is
      --pragma Priority(20);
      entry Ejecutar;
   end Girar;

   task body Girar is
   begin
      loop
         select
            accept Ejecutar do
               Put_Line ("Ejecutando: Girar");
               delay 1.0;
            end Ejecutar;
         or
            terminate;
         end select;
      end loop;
   end Girar;

   task Cargar is
      --pragma Priority(30);
      entry Ejecutar;
   end Cargar;

   task body Cargar is
   begin
      loop
         select
            accept Ejecutar do
               Put_Line ("Ejecutando: Cargar");
               delay 1.0;
            end Ejecutar;
         or
            terminate;
         end select;
      end loop;
   end Cargar;

   task DispararAlEnemigo is
      --pragma Priority(40);
      entry Ejecutar (Valor : in Integer);
   end DispararAlEnemigo;

   task body DispararAlEnemigo is
   begin
      loop
         select
            accept Ejecutar (Valor : in Integer) do
               --  Case statement
               case Valor is
                  when 1 =>
                     Put_Line ("Disparando fusil.");

                  when 2 =>
                     Put_Line ("Disparando metralleta.");

                  when 3 =>
                     Put_Line ("Disparando cañón de riel.");

                  when 4 =>
                     Put_Line ("Disparando ondas gravitacionales.");

                  when 5 =>
                     Put_Line ("Disparando cañón de antimateria.");

                  when others =>
                     Put_Line ("Tipo de arma desconocida.");
               end case;
               delay 1.0;
            end Ejecutar;
         or
            terminate;
         end select;
      end loop;
   end DispararAlEnemigo;

   task Robot;
   task body Robot is
      Estado   : Common.Estado_Tipo;
      Metas    : Metas_Array;
      Acciones : Acciones_Array;
      Mision   : Mision_tipo;
      Balas    : Integer;
   begin
      Balas := 1;
      for I in 1 .. 5 loop
         Estado := Common.Leer_Sensores;

         Put_Line ("Detectando estado...");
         Put_Line ("  Obstáculo: " & Boolean'Image (Estado.Hay_Obstaculo));
         Put_Line ("  Camino libre: " & Boolean'Image (Estado.Camino_Libre));
         Put_Line ("  Batería baja: " & Boolean'Image (Estado.Bateria_Baja));
         Put_Line ("  Enemigo: " & Boolean'Image (Estado.Enemigo));

         -- Obtener misión
         PEAN.Obtener_Mision (Estado, Mision);
         Put_Line ("Misión asignada: " & Mision'Image);

         PE.Evaluar (Mision, Estado, Balas, Metas);
         -- Visualizar metas antes de planear
         Put_Line ("Metas determinadas:");
         for I in Metas'Range loop
            Put_Line
              ("  Meta "
               & Integer'Image (I)
               & ": "
               & Meta_Tipo'Image (Metas (I)));
         end loop;
         PT.Planear (Metas, Estado);
         delay 0.2;

         Acc.Obtener (Acciones);

         -- Ejecutar las acciones según su prioridad
         for I in Acciones'Range loop
            declare
               Nombre : constant String := To_String (Acciones (I).Nombre);
            begin
               exit when Nombre = "Esperar";
               if Nombre = "Avanzar" then
                  Avanzar.Ejecutar;
               elsif Nombre = "Girar" then
                  Girar.Ejecutar;
               elsif Nombre = "Cargar" then
                  Cargar.Ejecutar;
               elsif Nombre'Length >= 8 and then Nombre (1 .. 8) = "Disparar"
               then
                  if Balas < 0 then
                     Put_Line ("No hay balas disponibles");
                  else
                     -- Disparar
                     DispararAlEnemigo.Ejecutar
                       (Integer'Value (Nombre (9 .. Nombre'Last)));
                     Balas := Balas - 1;
                     Put_Line ("Balas restantes: " & Integer'Image (Balas));
                  end if;
               elsif Nombre = "Recargar_Balas" then
                  -- Recargar balas
                  Balas := 1;
                  Put_Line ("Balas recargadas: " & Integer'Image (Balas));
               end if;
            end;
         end loop;

         Acc.Resetear;
         delay 0.5;
      end loop;
   end Robot;

begin
   null;
end Robot_Jerarquico;
