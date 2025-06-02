function Factorial (N : Integer) return Integer is
begin
   if N = 0 then
      return 1;
   else
      return N * Factorial (N - 1);
   end if;
end Factorial;
