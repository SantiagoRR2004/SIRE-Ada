package Buffer_Interface is

   type IBuffer is task interface;
   procedure Insertar (B : in out IBuffer; I : in Integer) is abstract;
   procedure Extraer (B : in out IBuffer; I : out Integer) is abstract;

end Buffer_Interface;
