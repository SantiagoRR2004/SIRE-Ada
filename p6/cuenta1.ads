with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

package Cuenta1 is
   type Cuenta_bancaria is private;
   function Crear
     (Titular : Unbounded_String; Saldo : Float) return Cuenta_bancaria;
   procedure Depositar (Cuenta : in out Cuenta_bancaria; Monto : Float);
   procedure Retirar (Cuenta : in out Cuenta_bancaria; Monto : Float);
   function Consultar_Saldo (Cuenta : Cuenta_bancaria) return Float;
   function Consultar_Titular
     (Cuenta : Cuenta_bancaria) return Unbounded_String;
private
   type Cuenta_bancaria is record
      Titular : Unbounded_String;
      Saldo   : Float;
   end record;
end Cuenta1;
