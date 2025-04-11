package body Cuenta is
   function Crear(
      Titular : String;
      Saldo  : Float
   ) return Cuenta_bancaria is
      C : Cuenta_bancaria;
   begin
      C.Titular := Titular;
      C.Saldo := Saldo;
      return C;
   end Crear;

   function Depositar(
      Cuenta : in out Cuenta_bancaria;
      Monto  : Float
   ) is
   begin
      if Monto > 0.0 then
         Cuenta.Saldo := Cuenta.Saldo + Monto;
      end if;
   end Depositar;

   function Retirar(
      Cuenta : in out Cuenta_bancaria;
      Monto  : Float
   ) is
   begin
      if Monto > 0.0 and Monto <= Cuenta.Saldo then
         Cuenta.Saldo := Cuenta.Saldo - Monto;
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
   ) return String is
   begin
      return Cuenta.Titular;
   end Consultar_Titular;
end Cuenta;