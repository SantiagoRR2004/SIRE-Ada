with Banco, Cuenta, Ada.Text_IO, Ada.Strings.Unbounded;
use Ada.Text_IO;
use Ada.Strings.Unbounded;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;
procedure Main is
   B                                                : Banco.Banco_Array;
   C1, C2, C3, C4, C5                               : Cuenta.Cuenta_bancaria;
   Monto                                            : Float;
   Titular1, Titular2, Titular3, Titular4, Titular5 : Unbounded_String;
begin
   -- Crear el banco
   B := Banco.Crear_Banco;

   -- Crear titulares
   Titular1 := To_Unbounded_String ("Sergio");
   Titular2 := To_Unbounded_String ("Santiago");
   Titular3 := To_Unbounded_String ("María");
   Titular4 := To_Unbounded_String ("Juan");
   Titular5 := To_Unbounded_String ("Ana");

   -- Crear cuentas
   C1 := Cuenta.Crear (Titular1, 1_000.0);
   C2 := Cuenta.Crear (Titular2, 500.0);
   C3 := Cuenta.Crear (Titular3, 1_500.0);
   C4 := Cuenta.Crear (Titular4, 0.5);
   C5 := Cuenta.Crear (Titular5, 100.0);

   -- Agregar cuentas al banco
   Banco.Agregar_Cuenta (B, C1);
   Banco.Agregar_Cuenta (B, C2);
   Banco.Agregar_Cuenta (B, C3);
   Banco.Agregar_Cuenta (B, C4);
   Banco.Agregar_Cuenta (B, C5);

   -- Saldo del banco inicial
   Put ("Saldo inicial del banco: ");
   Put (Banco.Consultar_Saldo_Banco (B), Fore => 1, Aft => 2, Exp => 0);
   New_Line;
   New_Line;

   -- Hacer una transferencia
   Monto := 200.0;
   Put ("Saldo de " & To_String (Titular1) & " antes de la transferencia: ");
   Put (Banco.Consultar_Cuenta (B, Titular1), Fore => 1, Aft => 2, Exp => 0);
   New_Line;
   Put ("Saldo de " & To_String (Titular2) & " antes de la transferencia: ");
   Put (Banco.Consultar_Cuenta (B, Titular2), Fore => 1, Aft => 2, Exp => 0);
   New_Line;
   Banco.Transferir (B, Titular1, Titular2, Monto);
   Put ("Saldo de " & To_String (Titular1) & " después de la transferencia: ");
   Put (Banco.Consultar_Cuenta (B, Titular1), Fore => 1, Aft => 2, Exp => 0);
   New_Line;
   Put ("Saldo de " & To_String (Titular2) & " después de la transferencia: ");
   Put (Banco.Consultar_Cuenta (B, Titular2), Fore => 1, Aft => 2, Exp => 0);
   New_Line;
   Put ("Total en el banco: ");
   Put (Banco.Consultar_Saldo_Banco (B), Fore => 1, Aft => 2, Exp => 0);
   New_Line;
   New_Line;

   -- Realizar un retiro
   Monto := 300.0;
   Put ("Saldo de " & To_String (Titular1) & " antes del retiro: ");
   Put (Banco.Consultar_Cuenta (B, Titular1), Fore => 1, Aft => 2, Exp => 0);
   New_Line;
   Banco.Retirar (B, Cuenta.Consultar_Titular (C1), Monto);
   Put ("Saldo de " & To_String (Titular1) & " después del retiro: ");
   Put (Banco.Consultar_Cuenta (B, Titular1), Fore => 1, Aft => 2, Exp => 0);
   New_Line;
   New_Line;

   -- Realizar un depósito
   Monto := 150.0;
   Put ("Saldo de " & To_String (Titular2) & " antes del depósito: ");
   Put (Banco.Consultar_Cuenta (B, Titular2), Fore => 1, Aft => 2, Exp => 0);
   New_Line;
   Banco.Depositar (B, Cuenta.Consultar_Titular (C2), Monto);
   Put ("Saldo de " & To_String (Titular2) & " después del depósito: ");
   Put (Banco.Consultar_Cuenta (B, Titular2), Fore => 1, Aft => 2, Exp => 0);
   New_Line;
   New_Line;

   -- Consultar saldo total del banco
   Put ("Total en el banco después de las transacciones: ");
   Put (Banco.Consultar_Saldo_Banco (B), Fore => 1, Aft => 2, Exp => 0);
   New_Line;

   -- Finalizar cuentas
   Banco.Finalizar (B);
end Main;
