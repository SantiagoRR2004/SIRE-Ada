with Cuenta;

package body Banco is

   function Crear_Banco return Banco_Array is
      B : Banco_Array;
   begin
      for I in B'Range loop
         -- Initialize each element task of the array to null
         Cuenta.Crear_Task_null (B (I));
      end loop;
      return B;
   end Crear_Banco;

   procedure Agregar_Cuenta
     (B : in out Banco_Array; C : in Cuenta.Cuenta_bancaria) is
   begin
      for I in B'Range loop
         if Cuenta.Check_null (B (I)) then
            B (I) := C;
            return;
         end if;
      end loop;
      raise Constraint_Error with "No hay espacio para agregar más cuentas.";
   end Agregar_Cuenta;

   procedure Transferir
     (B : in out Banco_Array; T1, T2 : in Unbounded_String; Monto : in Float)
   is
      C1, C2                   : Cuenta.Cuenta_bancaria;
      Encontrado1, Encontrado2 : Boolean := False;
   begin
      for I in B'Range loop
         if not Encontrado1
           and then not Cuenta.Check_null (B (I))
           and then Cuenta.Consultar_Titular (B (I)) = T1
         then
            C1 := B (I);
            Encontrado1 := True;
         elsif not Encontrado2
           and then not Cuenta.Check_null (B (I))
           and then Cuenta.Consultar_Titular (B (I)) = T2
         then
            C2 := B (I);
            Encontrado2 := True;
         end if;
         exit when Encontrado1 and Encontrado2;
      end loop;

      if not (Encontrado1 and Encontrado2) then
         raise Constraint_Error with "Cuenta(s) no encontrada(s).";
      end if;

      if Cuenta.Consultar_Saldo (C1) >= Monto then
         Cuenta.Retirar (C1, Monto);
         Cuenta.Depositar (C2, Monto);
      else
         raise Constraint_Error
           with "Saldo insuficiente para realizar la transferencia.";
      end if;
   end Transferir;

   function Consultar_Cuenta
     (B : in Banco_Array; T : in Unbounded_String) return Float is
   begin
      for I in B'Range loop
         if not Cuenta.Check_null (B (I))
           and then Cuenta.Consultar_Titular (B (I)) = T
         then
            return Cuenta.Consultar_Saldo (B (I));
         end if;
      end loop;
      raise Constraint_Error with "Cuenta no encontrada.";
   end Consultar_Cuenta;

   function Consultar_Saldo_Banco (B : in Banco_Array) return Float is
      Total : Float := 0.0;
   begin
      for I in B'Range loop
         if not Cuenta.Check_null (B (I)) then
            Total := Total + Cuenta.Consultar_Saldo (B (I));
         end if;
      end loop;
      return Total;
   end Consultar_Saldo_Banco;

   procedure Depositar
     (B : in out Banco_Array; Titular : in Unbounded_String; Monto : in Float)
   is
   begin
      for I in B'Range loop
         if not Cuenta.Check_null (B (I))
           and then Cuenta.Consultar_Titular (B (I)) = Titular
         then
            Cuenta.Depositar (B (I), Monto);
            return;
         end if;
      end loop;
      raise Constraint_Error with "Cuenta no encontrada para depósito.";
   end Depositar;

   procedure Retirar
     (B : in out Banco_Array; Titular : in Unbounded_String; Monto : in Float)
   is
   begin
      for I in B'Range loop
         if not Cuenta.Check_null (B (I))
           and then Cuenta.Consultar_Titular (B (I)) = Titular
         then
            Cuenta.Retirar (B (I), Monto);
            return;
         end if;
      end loop;
      raise Constraint_Error with "Cuenta no encontrada para retiro.";
   end Retirar;

   procedure Finalizar (B : in out Banco_Array) is
   begin
      for I in B'Range loop
         if not Cuenta.Check_null (B (I)) then
            Cuenta.Finalizar (B (I));
         end if;
      end loop;
   end Finalizar;

end Banco;
