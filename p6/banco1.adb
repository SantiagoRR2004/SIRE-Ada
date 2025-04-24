with Cuenta;
package body Banco is
   function Crear_Banco return Banco_Array is
      B : Banco_Array;
   begin
      for I in 1 .. 10 loop
         B (I) := Cuenta.Crear (To_Unbounded_String (""), 0.0);
      end loop;
      return B;
   end Crear_Banco;

   procedure Agregar_Cuenta
     (B : in out Banco_Array; C : in Cuenta.Cuenta_bancaria)
   is
      I : Integer;
   begin
      for I in 1 .. 10 loop
         if Cuenta.Consultar_Titular (B (I)) = To_Unbounded_String ("") then
            B (I) := C;
            return;
         end if;
      end loop;
      raise Constraint_Error with "No hay espacio para agregar más cuentas.";
   end Agregar_Cuenta;

   procedure Transferir
     (B : in out Banco_Array; T1, T2 : in Unbounded_String; Monto : in Float)
   is
      I1, I2 : Integer;
      C1, C2 : Cuenta.Cuenta_bancaria;
   begin
      for I1 in 1 .. 10 loop
         if Cuenta.Consultar_Titular (B (I1)) = T1 then
            C1 := B (I1);
            exit;
         end if;
      end loop;
      for I2 in 1 .. 10 loop
         if Cuenta.Consultar_Titular (B (I2)) = T2 then
            C2 := B (I2);
            exit;
         end if;
      end loop;
      if Cuenta.Consultar_Saldo (C1) >= Monto then
         Cuenta.Retirar (C1, Monto);
         Cuenta.Depositar (C2, Monto);
      else
         raise Constraint_Error
           with "Saldo insuficiente para realizar la transferencia.";
      end if;
   end Transferir;

   function Consultar_Cuenta
     (B : in Banco_Array; T : in Unbounded_String) return Float
   is
      I : Integer;
   begin
      for I in 1 .. 10 loop
         if Cuenta.Consultar_Titular (B (I)) = T then
            return Cuenta.Consultar_Saldo (B (I));
         end if;
      end loop;
      raise Constraint_Error with "Cuenta no encontrada.";
   end Consultar_Cuenta;

   function Consultar_Saldo_Banco (B : in Banco_Array) return Float is
      Total : Float := 0.0;
   begin
      for I in 1 .. 10 loop
         Total := Total + Cuenta.Consultar_Saldo (B (I));
      end loop;
      return Total;
   end Consultar_Saldo_Banco;

   procedure Depositar
     (B : in out Banco_Array; Titular : in Unbounded_String; Monto : in Float)
   is
      I : Integer;
      C : Cuenta.Cuenta_bancaria;
   begin
      for I in 1 .. 10 loop
         if Cuenta.Consultar_Titular (B (I)) = Titular then
            Cuenta.Depositar (B (I), Monto);
            return;
         end if;
      end loop;
   end Depositar;

   procedure Retirar
     (B : in out Banco_Array; Titular : in Unbounded_String; Monto : in Float)
   is
      I : Integer;
   begin
      for I in 1 .. 10 loop
         if Cuenta.Consultar_Titular (B (I)) = Titular then
            Cuenta.Retirar (B (I), Monto);
            return;
         end if;
      end loop;
   end Retirar;

end Banco;
