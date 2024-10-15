void main() {
  // Se llama a la función `emitNumber` que retorna un Stream.
  // Usamos el método `listen` para escuchar y procesar los valores emitidos por el Stream.
  emitNumber().listen((int value) {
    // Esta función anónima se ejecutará cada vez que el Stream emita un nuevo valor.
    // Se imprimirá el valor recibido.
    print('Stream value: $value');
  });
}

// Esta función retorna un Stream de enteros utilizando una función generadora asíncrona `async*`.
Stream<int> emitNumber() async* {
  // Definimos una lista de valores que se quieren emitir a través del Stream.
  final valuesToEmit = [1, 2, 3, 4, 5];
  
  // Recorremos la lista y emitimos cada valor con un retraso de 1 segundo entre ellos.
  for (int i in valuesToEmit) {
    // Espera 1 segundo antes de emitir el siguiente valor.
    await Future.delayed(const Duration(seconds: 1));
    // `yield` envía el valor al Stream, que luego puede ser escuchado.
    yield i;
  }
}

// Nota: Es lo mismo pero se utiliza la funcion asincrona para mandar un valor, uno a uno al consumidor esperando que este listo para recibirlo