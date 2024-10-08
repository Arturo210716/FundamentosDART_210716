void main() {

//Declaracion de las Variables de Planta Nuclear y Planta Electrica
  final windPlant = WindPlant(initialEnergy: 100);
  final nuclearPlant = NuclearPlant(energyLeft: 1000);

  print('Consuma de Hidroelectrica : ${chargePhone(windPlant)}');
  print('Consumo de planta de Nuclear: ${chargePhone(nuclearPlant)}');
}

// Declaracion de las Clases

double chargePhone(EnergyPlant plant) {
  if (plant.energyLeft < 10) {
    throw Exception('Not enough energy');
  }

  return plant.energyLeft - 10;
}

// Selecciona uno de estos valores de la seleccion
enum PlantType { nuclear, wind, water }

// Declaracion de la Abstraccion de la clase
abstract class EnergyPlant {
  double energyLeft;
  final PlantType type; // nuclear, wind, water -> se declara la propiedad

// se agregan las propiedades
  EnergyPlant({
    required this.energyLeft,
    required this.type,
  });

  void consumeEnergy(double amount);
}

// Extends example

class WindPlant extends EnergyPlant {
  WindPlant({required double initialEnergy})
  // se ingresa los consumo de la variable padre para descontar al hijo 
      : super(energyLeft: initialEnergy, type: PlantType.wind);

  @override
  void consumeEnergy(double amount) {
    energyLeft -= amount;
  }
}

// Extends instead of Implements for consistency

class NuclearPlant extends EnergyPlant {
  NuclearPlant({required double energyLeft})
      : super(energyLeft: energyLeft, type: PlantType.nuclear);

  @override
  void consumeEnergy(double amount) {
    energyLeft -= (amount * 0.5);
  }
}