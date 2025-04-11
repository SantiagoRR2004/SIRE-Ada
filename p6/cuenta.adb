package body Cuenta is
   function Crear(
      Titular : Unbounded_String;
      Saldo  : Float
   ) return Cuenta_bancaria is
      C : Cuenta_bancaria;
   begin
      C.Titular := Titular;
      C.Saldo := Saldo;
      return C;
   end Crear;

   procedure Depositar(
      Cuenta : in out Cuenta_bancaria;
      Monto  : Float
   ) is
   begin
      if Monto > 0.0 then
         Cuenta.Saldo := Cuenta.Saldo + Monto;
      end if;
   end Depositar;

   procedure Retirar(
      Cuenta : in out Cuenta_bancaria;
      Monto  : Float
   ) is
   begin
      if Monto > 0.0 and Monto <= Cuenta.Saldo then
         Cuenta.Saldo := Cuenta.Saldo - Monto;
      else
         raise Constraint_Error with "Monto inválido para retirar.";
      end if;
   end Retirar;

   function Consultar_Saldo(
      Cuenta : Cuenta_bancaria
   ) return Float is
   begin
      return Cuenta.Saldo;
   end Consultar_Saldo;

   function Consultar_Titular(
      Cuenta : Cuenta_bancaria
   ) return Unbounded_String is
   begin
      return Cuenta.Titular;
   end Consultar_Titular;
end Cuenta;