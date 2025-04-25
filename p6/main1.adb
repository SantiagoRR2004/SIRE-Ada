with Banco1, Cuenta1, Ada.Text_IO, Ada.Strings.Unbounded;
use Ada.Text_IO;
use Ada.Strings.Unbounded;

procedure Main1 is
   B                  : Banco1.Banco_Array;
   C1, C2             : Cuenta1.Cuenta_bancaria;
   Monto              : Float;
   Titular1, Titular2 : Unbounded_String;
   Saldo1, Saldo2     : Float;
   Total_Banco        : Float;
begin
   -- Crear el banco
   B := Banco1.Crear_Banco;
   -- Crear cuentas
   C1 := Cuenta1.Crear (To_Unbounded_String ("Sergio"), 1_000.0);
   C2 := Cuenta1.Crear (To_Unbounded_String ("Santiago"), 500.0);
   -- Agregar cuentas al banco
   Banco1.Agregar_Cuenta (B, C1);
   Banco1.Agregar_Cuenta (B, C2);
   -- Hacer una transferencia
   Titular1 := To_Unbounded_String ("Sergio");
   Titular2 := To_Unbounded_String ("Santiago");
   Monto := 200.0;
   Banco1.Transferir (B, Titular1, Titular2, Monto);
   -- Consultar saldo de las cuentas
   Saldo1 := Banco1.Consultar_Cuenta (B, Titular1);
   Saldo2 := Banco1.Consultar_Cuenta (B, Titular2);
   Total_Banco := Banco1.Consultar_Saldo_Banco (B);
   -- Mostrar resultados
   Put_Line ("Saldo de " & To_String (Titular1) & ": " & Float'Image (Saldo1));
   Put_Line ("Saldo de " & To_String (Titular2) & ": " & Float'Image (Saldo2));
   Put_Line ("Total en el banco: " & Float'Image (Total_Banco));
   -- Realizar un retiro
   Monto := 300.0;
   Banco1.Retirar (B, Cuenta1.Consultar_Titular (C1), Monto);
   -- Consultar saldo después del retiro
   Saldo1 := Banco1.Consultar_Cuenta (B, Titular1);
   -- Mostrar saldo después del retiro
   Put_Line
     ("Saldo de "
      & To_String (Titular1)
      & " después del retiro: "
      & Float'Image (Saldo1));
   -- Realizar un depósito
   Monto := 150.0;
   Banco1.Depositar (B, Cuenta1.Consultar_Titular (C2), Monto);
   -- Consultar saldo después del depósito
   Saldo2 := Banco1.Consultar_Cuenta (B, Titular2);
   -- Mostrar saldo después del depósito
   Put_Line
     ("Saldo de "
      & To_String (Titular2)
      & " después del depósito: "
      & Float'Image (Saldo2));
   -- Consultar saldo total del banco
   Total_Banco := Banco1.Consultar_Saldo_Banco (B);
   -- Mostrar saldo total del banco
   Put_Line
     ("Total en el banco después de las transacciones: "
      & Float'Image (Total_Banco));
end Main1;
