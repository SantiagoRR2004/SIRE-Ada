with Buffer_Interface; -- Import the interface

task body MyBuffer is
   -- Declare a buffer here (you might use an array or a queue, depending on your design)
   Buffer : array(1 .. 10) of Integer; -- Example buffer of 10 integers
   Index : Integer := 1;

   -- Implement Insertar
   procedure Insertar(D : in Integer) is
   begin
      -- Insert data into the buffer (you can add overflow handling)
      if Index <= 10 then
         Buffer(Index) := D;
         Index := Index + 1;
      else
         -- Handle overflow if needed
         null;
      end if;
   end Insertar;

   -- Implement Extraer
   procedure Extraer(D : out Integer) is
   begin
      if Index > 1 then
         -- Extract data from the buffer
         Index := Index - 1;
         D := Buffer(Index);
      else
         -- Handle underflow if needed
         null;
      end if;
   end Extraer;

end MyBuffer;

--  package Buffer_Interface is
--     type Element_Type is private;    -- whatever you buffer

--     task IBuffer is new interface
--        entry Insertar (Item : in  Element_Type);
--        entry Extraer  (Item : out Element_Type);
--     end IBuffer;

--  private
--     type Element_Type is Integer;    -- or your real definition
--  end Buffer_Interface;

   --     --  A task interface with exactly the two entries we require
   --     --  type IBuffer is task interface;
   --     --  entry Insertar (D : in Integer) is abstract;
   --     --  entry Extraer (D : out Integer) is abstract;
