with Cuenta1;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

package Banco1 is
   type Banco_Array is private;

   function Crear_Banco return Banco_Array;

   procedure Agregar_Cuenta
     (B : in out Banco_Array; C : in Cuenta1.Cuenta_bancaria);

   procedure Transferir
     (B : in out Banco_Array; T1, T2 : in Unbounded_String; Monto : in Float);

   function Consultar_Cuenta
     (B : in Banco_Array; T : in Unbounded_String) return Float;

   function Consultar_Saldo_Banco (B : in Banco_Array) return Float;

   procedure Depositar
     (B : in out Banco_Array; Titular : in Unbounded_String; Monto : in Float);

   procedure Retirar
     (B : in out Banco_Array; Titular : in Unbounded_String; Monto : in Float);

private
   type Banco_Array is array (1 .. 10) of Cuenta1.Cuenta_bancaria;

end Banco1;
