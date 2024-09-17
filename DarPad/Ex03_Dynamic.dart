void main() {
  // Practica 05: Tipo de dato: Dinamico (Dynamic)
  
  // Se puede declarar sin inicializar
  dynamic errorMessage;
  
  print("""
    El valor inicial de errorMessage es: $errorMessage
    Que por defecto permite establecer valores nulos
  """);
  
  // Ahora le asignamos un valor String
  errorMessage = "El nombre y la contraseña no coinciden";
  
  print("""
    El nuevo valor de errorMessage es: $errorMessage
    En este caso le fue asignado un String
  """);
  
  // En el caso de ser dinamico le podemos asignar un Entero
  errorMessage=404;
  
  print("""
    El nuevo valor de errorMessage es: $errorMessage
    En algunos sistemas los errores son controlados por un codigo numerico
  """);
  
  // Pero al ser dinamico le podemos asignar un Boolean
  errorMessage=false;
  
  print("""
    El nuevo valor de errorMessage es: $errorMessage
    Cuando el sistema funciona correctamente el mensaje de error puede ser Falso
  """);

  // Pero al ser dinamico le podemos asignar una Lista
  errorMessage=[100,200,300,400];
  
  print("""
    El nuevo valor de errorMessage es: $errorMessage
    En caso de que el sistema detecte varios errores podria agregarlos a una lista
  """);

    // Pero al ser dinamico le podemos asignar una Lista de varios tipos de datos
  errorMessage={100,"El nombre y la contraseña no coinciden",-1025.16,'A'};
  
  print("""
    El nuevo valor de errorMessage es: $errorMessage
    O inlcuso como un conjunto (SET) de datos
  """);

  errorMessage = {125,'Usuario no encontrado',true,-1025.16,'A'};
  
}
