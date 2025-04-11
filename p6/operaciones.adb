package body Operaciones is
    function Sumar (A, B : Integer) return Integer is
    begin
        return A + B;
    end Sumar;
    function Multiplicar (A, B : Integer) return Integer is
    begin
        return A * B;
    end Multiplicar;
    function Cuadrado (A : Integer) return Integer is
    begin
        return A * A;
    end Cuadrado;
end Operaciones;
