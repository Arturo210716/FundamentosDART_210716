// Clase abstracta que representa a una persona con atributos básicos como nombre, apellido, fecha de nacimiento y género.
abstract class Persona {
  String cortesyTitle;
  String nombre;
  String primerApellido;
  String segundoApellido;
  String genero;
  String grupoSanguineo;
  DateTime fechaNacimiento;
  String curp;

  // Constructor de la clase Persona que inicializa los atributos básicos.
  Persona({
    required this.cortesyTitle,
    required this.nombre,
    required this.primerApellido,
    required this.segundoApellido,
    required this.genero,
    required this.grupoSanguineo,
    required this.fechaNacimiento,
    this.curp = 'No aplica',
  });

  // Método que formatea una fecha dada en el formato YYYY-MM-DD.
  String formatoFecha(DateTime fecha) {
    return '${fecha.year.toString().padLeft(4, '0')}-${fecha.month.toString().padLeft(2, '0')}-${fecha.day.toString().padLeft(2, '0')}';
  }

  // Sobrescribe el método toString() para imprimir una representación detallada de la persona.
  @override
  String toString() {
    return '''
    --------------------------------------------------------------
    DATOS DE LA PERSONA
    --------------------------------------------------------------
    Título: $cortesyTitle
    Nombre completo: $nombre $primerApellido $segundoApellido
    CURP: $curp
    Género: $genero, Grupo Sanguíneo: $grupoSanguineo
    Fecha de nacimiento: ${formatoFecha(fechaNacimiento)}
    --------------------------------------------------------------
    ''';
  }
}

// Clase que extiende la clase abstracta Persona para representar a un paciente con atributos adicionales.
class Paciente extends Persona {
  String nss;            // Número de Seguro Social del paciente.
  String tipoSeguro;      // Tipo de seguro médico (público o privado).
  String estatusVida;     // Estatus de vida del paciente (vivo o fallecido).
  String estatusMedico;   // Estado de salud actual del paciente (estable, crítico, etc.).
  DateTime fechaRegistro; // Fecha en la que el paciente fue registrado en el sistema.
  DateTime fechaUltimaCita; // Fecha de la última cita médica del paciente.

  // Constructor que inicializa todos los atributos, incluyendo los de la clase base Persona.
  Paciente({
    required String cortesyTitle,
    required String nombre,
    required String primerApellido,
    required String segundoApellido,
    required String genero,
    required String grupoSanguineo,
    required DateTime fechaNacimiento,
    String curp = 'No aplica',  // Si no se proporciona curp, será 'No aplica'.
    this.nss = 'No aplica',     // Si no se proporciona nss, será 'No aplica'.
    required this.tipoSeguro,
    required this.estatusVida,
    required this.estatusMedico,
    required this.fechaRegistro,
    required this.fechaUltimaCita,
  }) : super(
            cortesyTitle: cortesyTitle,
            nombre: nombre,
            primerApellido: primerApellido,
            segundoApellido: segundoApellido,
            genero: genero,
            grupoSanguineo: grupoSanguineo,
            fechaNacimiento: fechaNacimiento,
            curp: curp); // Llamada al constructor de la clase base.

  // Método que cambia el estatus de vida del paciente a 'Fallecido' y actualiza su estatus médico.
  void registrarDefuncion() {
    estatusVida = 'Fallecido';
    estatusMedico = 'No aplica'; // El estado médico deja de ser relevante.
    fechaUltimaCita = DateTime.now(); // Se registra la fecha de la defunción como la última "cita".
    print('El paciente ha sido registrado como fallecido.');
  }

  // Sobrescribe el método toString() para incluir los datos específicos del paciente.
  @override
  String toString() {
    return '''
    ${super.toString()} // Llamada al método toString() de la clase base para imprimir los datos personales.
    --------------------------------------------------------------
    DATOS DEL PACIENTE
    --------------------------------------------------------------
    NSS: $nss
    Tipo Seguro: $tipoSeguro
    Estatus de Vida: $estatusVida
    Estatus Médico: $estatusMedico
    Fecha Registro: ${formatoFecha(fechaRegistro)}
    Fecha Última Cita: ${formatoFecha(fechaUltimaCita)}
    --------------------------------------------------------------
    ''';
  }
}

void main() {
  // Caso 1: Se crea un nuevo paciente registrado hoy con estado de salud estable.
  Paciente arturo = Paciente(
    cortesyTitle: 'Ing.',
    nombre: 'Arturo',
    primerApellido: 'Aguilar',
    segundoApellido: 'Santos',
    genero: 'Masculino',
    grupoSanguineo: 'B+',
    fechaNacimiento: DateTime(2003, 9, 01),
    curp: 'AUSA030901HPLGNRA2',
    nss: '123456789',
    tipoSeguro: 'Público',
    estatusVida: 'Vivo',
    estatusMedico: 'Estable',
    fechaRegistro: DateTime.now(),
    fechaUltimaCita: DateTime.now(),
  );
  print('Caso 1: Nuevo paciente registrado hoy:\n$arturo');

  // Caso 2: Paciente que trabajó en el hospital, con un estado de salud estable y última cita en 2024.
  Paciente house = Paciente(
    cortesyTitle: 'Dr.',
    nombre: 'House',
    primerApellido: 'Gregory',
    segundoApellido: 'Laurie',
    genero: 'Masculino',
    grupoSanguineo: 'A+',
    fechaNacimiento: DateTime(1985, 8, 12),
    tipoSeguro: 'Privado',
    estatusVida: 'Vivo',
    estatusMedico: 'Estable',
    fechaRegistro: DateTime(2022, 1, 10),
    fechaUltimaCita: DateTime(2024, 5, 5),
  );
  print('Caso 2: Paciente ex trabajador del hospital:\n$house');

  // Caso 3: Paciente que acaba de fallecer, con un estado crítico antes de su defunción.
  Paciente edgar = Paciente(
    cortesyTitle: 'Sr.',
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
  print('Caso 3 (antes de registrar defunción):\n$edgar');

  // Se registra la defunción del paciente.
  edgar.registrarDefuncion();
  print('Caso 3 (después de registrar defunción):\n$edgar');
}
