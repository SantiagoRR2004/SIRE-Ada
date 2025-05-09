with Ada.Text_IO; use Ada.Text_IO;

procedure Robot_Fase_1 is

   type Estado_Tipo is record
      Hay_Obstaculo : Boolean := False;
      Camino_Libre  : Boolean := False;
      Bateria_Baja  : Boolean := False;
   end record;

   function Leer_Sensores(Paso: Integer) return Estado_Tipo is
      -- Simula lectura de sensores
   begin
      case Paso mod 6 is
         when 0 => return (True, False, False);   -- Obstáculo
         when 1 => return (False, True, False);   -- Camino libre
         when 2 => return (False, False, True);   -- Batería baja
         when 3 => return (True, True, False);    -- Obstáculo + libre
         when 4 => return (True, False, True);    -- Obstáculo + batería baja
         when others => return (False, True, True); -- Camino libre + batería baja
      end case;
   end Leer_Sensores;

   procedure Planificar(E: Estado_Tipo) is
   begin
      Put_Line("Estado detectado:");
      Put_Line("  Obstáculo: " & Boolean'Image(E.Hay_Obstaculo));
      Put_Line("  Camino libre: " & Boolean'Image(E.Camino_Libre));
      Put_Line("  Batería baja: " & Boolean'Image(E.Bateria_Baja));

      -- Lógica determinista
      if E.Bateria_Baja then
         Put_Line("→ Acción: Cargar");
      elsif E.Hay_Obstaculo then
         Put_Line("→ Acción: Girar");
      elsif E.Camino_Libre then
         Put_Line("→ Acción: Avanzar");
      else
         Put_Line("→ Acción: Esperar");
      end if;
   end Planificar;

begin
   for I in 1 .. 10 loop
      declare
         Estado : Estado_Tipo := Leer_Sensores(I);
      begin
         Planificar(Estado);
         delay 1.0; -- Simula tiempo entre ciclos
      end;
   end loop;
end Robot_Fase_1;
