package Buffer_Interface is

   task type IBuffer is
      entry Insertar (I : in Integer);
      entry Extraer (I : out Integer);
   end IBuffer;

end Buffer_Interface;
