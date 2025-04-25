# Explicacion

En el paquete [Cuenta](../p6/cuenta.ads), se ha definido una tarea denominada `Cuenta_Task`. Al ser creada, esta tarea permanece en espera hasta ser debidamente inicializada mediante la asignación del nombre del titular y el saldo inicial de la cuenta. Una vez realizada la inicialización, la tarea entra en un bucle principal, del cual solo saldrá cuando:

- La variable booleana `Finalizar_Proceso` tome el valor True, lo que indica que debe finalizar su ejecución.
- Se acabe el programa principal y se active el `terminate`.

Dado que las operaciones sobre la cuenta (como depósitos, retiros o consultas) no pueden ejecutarse de forma concurrente sin riesgo de inconsistencias, se emplea la estructura select-or junto con la instrucción accept. Esta combinación permite que la tarea permanezca en espera hasta que se invoque alguna de las cinco entradas disponibles: `Depositar`, `Retirar`, `Consultar_Saldo`, `Consultar_Titular` y `Finalizar`. Para facilitar la interacción externa con estas entradas, se han definido funciones públicas dentro del paquete Cuenta, las cuales actúan como interfaz hacia las entry de la tarea. Esto permite encapsular el acceso, evitando la necesidad de interactuar directamente con las tareas desde el paquete Banco o desde el programa principal.

En cuanto al paquete Banco, se ha modificado la forma en que se inicializa el arreglo `Banco_Array`. Anteriormente, este arreglo se instanciaba directamente con diez cuentas sin nombre, lo cual provocaba la creación inmediata de diez tareas activas. Aunque estas tareas no afectaban directamente la ejecución del programa al estar a la espera de ser inicializadas, se consideró más eficiente evitar la creación de tareas innecesarias. Por ello, se optó por inicializar el arreglo con tareas nulas, evitando así el uso de recursos en segundo plano hasta que realmente se requiera instanciar una cuenta.
