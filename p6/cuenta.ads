with Ada.Strings.Unbounded;

package Cuenta is
   use Ada.Strings.Unbounded;

   type Cuenta_bancaria is private;

   function Crear
     (Titular : Unbounded_String; Saldo : Float) return Cuenta_bancaria;

   procedure Crear_Task_null (Cuenta : in out Cuenta_bancaria);

   function Check_null (Cuenta : in Cuenta_bancaria) return Boolean;

   procedure Depositar (Cuenta : in out Cuenta_bancaria; Monto : Float);

   procedure Retirar (Cuenta : in out Cuenta_bancaria; Monto : Float);

   function Consultar_Saldo (Cuenta : Cuenta_bancaria) return Float;

   function Consultar_Titular
     (Cuenta : Cuenta_bancaria) return Unbounded_String;

   procedure Finalizar (Cuenta : in out Cuenta_bancaria);

private

   task type Cuenta_Task is
      entry Inicializar (Titular : Unbounded_String; SaldoI : Float);
      entry Depositar (Monto : Float);
      entry Retirar (Monto : Float);
      entry Consultar_Saldo (Result : out Float);
      entry Consultar_Titular (Result : out Unbounded_String);
      entry Finalizar;
   end Cuenta_Task;

   type Cuenta_Task_Access is access Cuenta_Task;

   type Cuenta_bancaria is record
      Tarea : Cuenta_Task_Access;
   end record;

end Cuenta;
