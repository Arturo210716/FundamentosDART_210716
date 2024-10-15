void main() async {

  print('Inicio del programa');
  
  // Para manejar posibles errores de la operación asíncrona.
  try {
    // La palabra clave `await` hace que el programa espere a que se complete la función `httpGet`.
    // Si la operación es exitosa, se almacena el resultado en `value` y se imprime.
    final value = await httpGet('https://fernando-herrera.com/cursos');
    print('éxito: $value');
    
  } on Exception catch(err) {
    // Si `httpGet` lanza una excepción de tipo `Exception`, este bloque se ejecutará.
    // Se imprime un mensaje indicando que ocurrió una excepción.
    print('Tenemos una Exception: $err');
    
  } catch (err) {
    // Si se lanza un error que no es de tipo `Exception`, este bloque se ejecutará.
    // Se imprime un mensaje genérico indicando que algo terrible pasó.
    print('OOP!! algo terrible pasó: $err');
    
  } finally {
    // Este bloque se ejecutará siempre, independientemente de si hubo éxito o un error.
    // Es útil para liberar recursos o realizar acciones finales.
    print('Fin del try y catch');
  }
  
  // Este mensaje se imprimirá después de que se haya completado todo el bloque try-catch-finally.
  print('Fin del programa');
}

// Esta función simula una solicitud HTTP y es asíncrona gracias a `async`.
// Devuelve un `Future` que se completará después de 1 segundo.
Future<String> httpGet(String url) async {
  // Simula un retraso de 1 segundo antes de realizar la operación.
  await Future.delayed(const Duration(seconds: 1));
  
  // Lanza una excepción de tipo `Exception` para simular un error en la solicitud HTTP.
  throw Exception('No hay parámetros en el URL');
  
  // Otros ejemplos que podrían lanzarse o retornar valores:
  // throw 'Error en la petición'; // Lanza un error genérico (no es `Exception`).
  // return 'Tenemos un valor de la petición'; // Simula una respuesta exitosa.
}
