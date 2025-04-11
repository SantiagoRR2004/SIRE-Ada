Utilizamos type Contacto como un tipo de dato que represente un Contacto, con Nombre, Email y Télefono. Todos estos datos con una longitud fija.

Luego Contact_Array consiste en un tipo array de 10 contactos para almacenarlos.

Atendiendo a las funciones y procedimientos, tenemos en primer lugar la función Pedir_Datos_Contactos que pide por terminal los datos de un nuevo contacto a incluir en el array. Esta devuelve el nuevo Contacto creado.

Este contacto se añade a la agenda con el procedimiento, Añadir_Contacto. En caso de que el array esté lleno, muestra un mensaje avisando.

La función Buscar_Contacto, busca un contacto por su nombre. Si lo encuentra lo devueve, en caso contrario, devuelve un contacto vacío.

Para mostrar un contacto por terminal se utiliza la el procedimiento Imprimir_Contacto. En caso de querer mostrar todos, empleamos el procedimiento Mostrar_Contacto, el cual muestra cada contacto del array usando el procedimiento anterior.

Es un bucle que muestra un menú interactivo al usuario con las siguientes opciones:

    'a' – Añadir un contacto.

    'b' – Buscar un contacto por nombre.

    'c' – Mostrar todos los contactos.

    'd' – Salir del programa.
