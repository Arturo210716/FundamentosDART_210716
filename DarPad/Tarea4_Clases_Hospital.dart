// Clase abstracta que representa a una persona con atributos básicos.
abstract class Persona {
  String titulo;
  String nombre;
  String primerApellido;
  String segundoApellido;
  String genero;
  String grupoSanguineo;
  DateTime fechaNacimiento;
  String curp;

  Persona({
    required this.titulo,
    required this.nombre,
    required this.primerApellido,
    required this.segundoApellido,
    required this.genero,
    required this.grupoSanguineo,
    required this.fechaNacimiento,
    this.curp = 'No aplica',
  });

  @override
  String toString() {
    return '''
    --------------------------------------------------------------
    DATOS DE LA PERSONA
    --------------------------------------------------------------
    Título: $titulo
    Nombre completo: $nombre $primerApellido $segundoApellido
    CURP: $curp
    Género: $genero, Grupo Sanguíneo: $grupoSanguineo
    Fecha de nacimiento: $fechaNacimiento
    --------------------------------------------------------------
    ''';
  }
}

// Clase que extiende la clase abstracta Persona para representar a un paciente.
class Paciente extends Persona {
  String nss;
  String tipoSeguro;
  String estatusVida;
  String estatusMedico;
  DateTime fechaRegistro;
  DateTime fechaUltimaCita;

  Paciente({
    required String titulo,
    required String nombre,
    required String primerApellido,
    required String segundoApellido,
    required String genero,
    required String grupoSanguineo,
    required DateTime fechaNacimiento,
    String curp = 'No aplica',
    this.nss = 'No aplica',
    required this.tipoSeguro,
    required this.estatusVida,
    required this.estatusMedico,
    required this.fechaRegistro,
    required this.fechaUltimaCita,
  }) : super(
            titulo: titulo,
            nombre: nombre,
            primerApellido: primerApellido,
            segundoApellido: segundoApellido,
            genero: genero,
            grupoSanguineo: grupoSanguineo,
            fechaNacimiento: fechaNacimiento,
            curp: curp);

  void registrarDefuncion() {
    estatusVida = 'Fallecido';
    estatusMedico = 'No aplica';
    fechaUltimaCita = DateTime.now();
    print('El paciente ha sido registrado como fallecido.');
  }

  @override
  String toString() {
    return '''
    ${super.toString()}
    --------------------------------------------------------------
    DATOS DEL PACIENTE
    --------------------------------------------------------------
    NSS: $nss
    Tipo Seguro: $tipoSeguro
    Estatus de Vida: $estatusVida
    Estatus Médico: $estatusMedico
    Fecha Registro: $fechaRegistro
    Fecha Última Cita: $fechaUltimaCita
    --------------------------------------------------------------
    ''';
  }
}

// Interfaz para la gestión de pacientes
abstract class RegistroPaciente {
  void registrar(Paciente paciente);
  void eliminar(String nss, String nombre);
  List<Paciente> listarPacientes();
}

// Clase que implementa la interfaz RegistroPaciente
class SistemaRegistro implements RegistroPaciente {
  List<Paciente> pacientes = [];

  @override
  void registrar(Paciente paciente) {
    pacientes.add(paciente);
    print('Paciente registrado: ${paciente.nombre}');
  }

  @override
  void eliminar(String nss, String nombre) {
    pacientes.removeWhere((p) => p.nss == nss);
    print('Paciente llamado $nombre con NSS $nss eliminado.');
  }

  @override
  List<Paciente> listarPacientes() {
    return pacientes;
  }
}

// Función principal
void main() {
  SistemaRegistro sistema = SistemaRegistro();

  // Caso 1: Se crea un nuevo paciente registrado hoy con estado de salud estable.
  Paciente arturo = Paciente(
    titulo: 'Ing.',
    nombre: 'Arturo',
    primerApellido: 'Aguilar',
    segundoApellido: 'Santos',
    genero: 'Masculino',
    grupoSanguineo: 'B+',
    fechaNacimiento: DateTime(2003, 9, 1),
    curp: 'AUSA030901HPLGNRA2',
    nss: '123456789',
    tipoSeguro: 'Público',
    estatusVida: 'Vivo',
    estatusMedico: 'Estable',
    fechaRegistro: DateTime.now(),
    fechaUltimaCita: DateTime.now(),
  );

  sistema.registrar(arturo);

  // Caso 2: Paciente que trabajó en el hospital, con un estado de salud estable y última cita en 2024.
  Paciente house = Paciente(
    titulo: 'Dr.',
    nombre: 'House',
    primerApellido: 'Gregory',
    segundoApellido: 'Laurie',
    genero: 'Masculino',
    grupoSanguineo: 'A+',
    fechaNacimiento: DateTime(1985, 8, 12),
    curp: 'HOGG850812HPLLRA5',
    nss: '987654321',
    tipoSeguro: 'Privado',
    estatusVida: 'Vivo',
    estatusMedico: 'Estable',
    fechaRegistro: DateTime(2022, 1, 10),
    fechaUltimaCita: DateTime(2024, 5, 5),
  );

  sistema.registrar(house);

  // Caso 3: Paciente que acaba de fallecer.
  Paciente edgar = Paciente(
    titulo: 'Sr.',
    nombre: 'Edgar',
    primerApellido: 'Sánchez',
    segundoApellido: 'Martínez',
    genero: 'Masculino',
    grupoSanguineo: 'B-',
    fechaNacimiento: DateTime(1945, 11, 5),
    curp: 'JPLGF8522358',
    nss: '1122334455',
    tipoSeguro: 'Público',
    estatusVida: 'Vivo',
    estatusMedico: 'Crítico',
    fechaRegistro: DateTime(2020, 2, 15),
    fechaUltimaCita: DateTime(2023, 8, 20),
  );

  sistema.registrar(edgar);

  // Listar pacientes
  print('Lista de pacientes:');
  sistema.listarPacientes().forEach((paciente) => print(paciente));

  // Se registra la defunción del paciente Edgar.
  edgar.registrarDefuncion();

  // Eliminar un paciente
  sistema.eliminar(arturo.nss,arturo.nombre);
  print('Lista de pacientes después de la eliminación:');
  sistema.listarPacientes().forEach((paciente) => print(paciente));
}

