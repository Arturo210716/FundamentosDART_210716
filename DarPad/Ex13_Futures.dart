void main() {
  print('Inicio del programa');
  
  // Se realiza solicitud HTTP.
  // La función `httpGet` devuelve un `Future`, que es una operación asíncrona que
  // se completará en el futuro. Aquí se utiliza el método `then` para manejar la 
  // respuesta exitosa cuando la operación finalice.
  httpGet('https://fernando-herrera.com/cursos')
    .then(
      (value) {
        // Esta función anónima se ejecutará si la operación es exitosa.
        // Imprime la respuesta de la solicitud HTTP.
        print(value);
      })
    .catchError((err) {
      // Esta función anónima se ejecutará si hay un error en la operación.
      print('Error: $err');
    });
  
  // Se imprime un mensaje indicando el fin del programa. 
  print('Fin del programa');
}

// Esta función simula una solicitud HTTP.
// Devuelve un `Future` que se completará después de 1 segundo.
Future<String> httpGet(String url) {
  // La función `Future.delayed` crea un `Future` que se completará después de 
  // un retraso de 1 segundo. En este caso, en lugar de devolver una respuesta exitosa,
  // se lanza una excepción que simula un error en la solicitud HTTP.
  return Future.delayed(const Duration(seconds: 1), () {
    // Lanzamos una excepción para simular un error en la solicitud HTTP.
    throw 'Error en la petición http';
    
    // Si descomentáramos la siguiente línea y comentáramos la excepción anterior,
    // simularíamos una respuesta exitosa en lugar de un error.
    // return 'Respuesta de la petición http';
  });

}