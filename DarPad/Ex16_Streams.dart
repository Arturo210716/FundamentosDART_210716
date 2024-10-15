void main() {

  // Se llama a la función `emitNumbers` que retorna un Stream.
  // Usamos el método `listen` para escuchar y procesar los valores que emite el Stream.
  emitNumbers().listen((value) {
    // Esta función anónima se ejecutará cada vez que el Stream emita un nuevo valor.
    // Se imprimirá el valor recibido.
    print('Stream value: $value');
  });
}

// Esta función retorna un Stream de enteros.
// `Stream.periodic` genera un valor cada cierto intervalo de tiempo (1 segundo en este caso).
Stream<int> emitNumbers() {
  return Stream.periodic(const Duration(seconds: 1), (value) {
    // Cada segundo se genera un nuevo valor, que se pasa a través del Stream.
    // La función `value` aquí representa el número de veces que se ha llamado hasta ahora.
    return value;
  }).take(5); // `take(5)` limita el Stream a emitir solo los primeros 5 valores.
}

// Nota: Stream, es una secuencia de eventos asíncronos