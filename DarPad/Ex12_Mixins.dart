abstract class Animal{}

abstract class Mamifero extends Animal{}
abstract class Ave extends Animal{}
abstract class Pez extends Animal{}

mixin Volador{
  void volar() => print('Estoy volando');
}

mixin Caminante{
  void caminar() => print('Estoy caminando');
}

mixin Nadador{
  void nadar() => print('Estoy nadando');
}

class Delfin extends Mamifero with Nadador {}
class Murcielago extends Mamifero with Volador,Caminante{}
class Gato extends Mamifero with Caminante{}

class Paloma extends Ave with Volador, Caminante{}
class Pato extends Ave with Nadador,Caminante,Volador{}

class Tiburon extends Pez with Nadador{}
class PexVolador extends Pez with Nadador,Volador{}

void main(){
  final flipper = Delfin();
  print("Instanciando la clase Delfin y accediendo a sus funciones");
  flipper.nadar();
  print("---------------------------------------------------------");
  print("Instanciando la clase Batman y accediendo a sus funciones");
  final batman = Murcielago();
  batman.caminar();
  batman.volar();
  print("---------------------------------------------------------");
  print("Instanciando la clase Lucas y accediendo a sus funciones");
  final lucas = Pato();
  lucas.caminar();
  lucas.volar();
  lucas.nadar();
  print("---------------------------------------------------------");
}