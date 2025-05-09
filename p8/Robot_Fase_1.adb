with Ada.Text_IO; use Ada.Text_IO;
with Common;

procedure Robot_Fase_1 is

   procedure Planificar (E : Common.Estado_Tipo) is
   begin
      Put_Line ("Estado detectado:");
      Put_Line ("  Obstáculo: " & Boolean'Image (E.Hay_Obstaculo));
      Put_Line ("  Camino libre: " & Boolean'Image (E.Camino_Libre));
      Put_Line ("  Batería baja: " & Boolean'Image (E.Bateria_Baja));

      -- Lógica determinista
      if E.Bateria_Baja then
         Put_Line ("→ Acción: Cargar");
      elsif E.Hay_Obstaculo then
         Put_Line ("→ Acción: Girar");
      elsif E.Camino_Libre then
         Put_Line ("→ Acción: Avanzar");
      else
         Put_Line ("→ Acción: Esperar");
      end if;
   end Planificar;

begin
   for I in 1 .. 10 loop
      declare
         Estado : Common.Estado_Tipo := Common.Leer_Sensores;
      begin
         Planificar (Estado);
         delay 1.0; -- Simula tiempo entre ciclos
      end;
   end loop;
end Robot_Fase_1;
