with Ada.Text_IO;           use Ada.Text_IO;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

package body Cuenta is

   task body Cuenta_Task is
      Nombre : Unbounded_String;
      Saldo  : Float;
   begin
      accept Inicializar (Titular : Unbounded_String; SaldoI : Float) do
         Nombre := Titular;
         Saldo  := SaldoI;
      end Inicializar;
      loop
         select
            accept Depositar (Monto : Float) do
               Saldo := Saldo + Monto;
            end Depositar;

         or
            accept Retirar (Monto : Float) do
               if Monto > 0.0 and Monto <= Saldo then
                  Saldo := Saldo - Monto;
               else
                  raise Constraint_Error with "Monto inválido para retirar.";
               end if;
            end Retirar;

         or
            accept Consultar_Saldo (Result : out Float) do
               Result := Saldo;
            end Consultar_Saldo;

         or
            accept Consultar_Titular (Result : out Unbounded_String) do
               Result := Nombre;
            end Consultar_Titular;
         end select;
      end loop;
   end Cuenta_Task;

   function Crear
     (Titular : Unbounded_String; Saldo : Float) return Cuenta_bancaria
   is
      Nueva_Cuenta : Cuenta_Task_Access;
   begin
      -- Create a new instance of Cuenta_Task dynamically
      Nueva_Cuenta := new Cuenta_Task;

      -- Initialize the task using its entry
      Nueva_Cuenta.Inicializar (Titular, Saldo);

      return (Tarea => Nueva_Cuenta);
   end Crear;

   procedure Depositar (Cuenta : in out Cuenta_bancaria; Monto : Float) is
   begin
      Cuenta.Tarea.Depositar (Monto);
   end Depositar;

   procedure Retirar (Cuenta : in out Cuenta_bancaria; Monto : Float) is
   begin
      Cuenta.Tarea.Retirar (Monto);
   end Retirar;

   function Consultar_Saldo (Cuenta : Cuenta_bancaria) return Float is
      Saldo : Float;
   begin
      Cuenta.Tarea.Consultar_Saldo (Saldo);
      return Saldo;
   end Consultar_Saldo;

   function Consultar_Titular
     (Cuenta : Cuenta_bancaria) return Unbounded_String
   is
      Nombre : Unbounded_String;
   begin
      Cuenta.Tarea.Consultar_Titular (Nombre);
      return Nombre;
   end Consultar_Titular;

end Cuenta;
