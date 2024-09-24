void main() {

// 1. Llamado de una funcion sin parametros
    greetEveryone();

// 2. Llamado de una funcion que retorna valores
    // a) Sin almacenar el valor en una variable
    print("Hoy es el dia numero: ${getDayNumber()} del mes");
    // b) Almacenaremos el valor de la funcion en una nueva variable
    final int diaMes;
    diaMes = getDayNumber();
    print("En tres dias sera: ${diaMes+3}");

// 3. Llamado de una funcion con un solo parametro obligatorio
    // a. Llamado correcto
    print(greetSomeone("Arturo"));
    // b. Llamado incorrecto con parametros que no son String
    print(greetSomeone(-321));
    print(greetSomeone(true));
    print(greetSomeone(123.4));
    print(greetSomeone(1));
// 3.1 Ahora hacemos el mismo experimento pero con la funcion de parametros tipados
    //print(greetSomeoneType(-321));
    //print(greetSomeoneType(true));
    //print(greetSomeoneType(123.4));
    //print(greetSomeoneType(1));
    
// 3.2 No funcionara por que necesita un parametro el cual esta definido como obligatorio
    //print(greetSomeone());
    
// 4. Llamado de una funcion con parametros opcionales
     //print(greetHourOfDay("Arturo",9));
     print(greetHourOfDay("Arturo",20));
     // a) Solo enviado al obligatorio
     print(greetHourOfDay("Arturo",null));

// 5. Funciones Lambda - Las funciones Lambda, mejor conocidas como funciones anonimas o funciones simplificadas, se ejecutan de manera simple
// y no frecuente en la ejecucion de un programa o sistema
  
var calcularCosto = (double productQuantity, double productPrice, double percentageDisscount) => (productQuantity * productPrice)*((100-percentageDisscount)/100);
  
double cantidadProducto = 5;
double precioProducto = 125.50;
double descuento = 2.5;
print("""
  Costo del producto: ${precioProducto}
  Cantidad: ${cantidadProducto}
  Descuento: ${descuento}
  -------------------------------------
  Costo del carrito de compras: ${calcularCosto(cantidadProducto,
  precioProducto,descuento)}
""");

}

// Funciones y Parametros

// Declaraciones
// 1. Funcion sin parametros, sin retorno de valor
void greetEveryone() {
    print("Hola a todos");
}

// 2. Funcion sin parametros, retorna datos
getDayNumber() {
    DateTime now = DateTime.now();
    int day = now.day;
    return day;
}

// 3. Funcion que recibe un parametro. En Dart si no se especifica como opcional, siempre sera obligatorio
String greetSomeone(personName) {
    return("Hola ${personName}");
}

//  3.1 Tipamos el parametro de entrada

String greetSomeoneType(String personNameType){
    return("Hola ${personNameType}");
}

// 4. Funcion con parametros opcionales
String greetHourOfDay(String personName, int? hora) { // int? Puede ser opcional - NullSafety
  hora ??= DateTime.now().hour; // Si es nulo entocnes ...

  String saludo;
  print("Hora: ${hora}");
  
  if (hora >= 6 && hora < 12) {
    saludo = "Buenos días"; 
  } else if (hora >= 12 && hora < 20) {
    saludo = "Buenas tardes";
  } else {
    saludo = "Buenas noches";
  }

  return "$saludo, $personName";
}