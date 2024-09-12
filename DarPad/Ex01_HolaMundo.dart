main(){
    
  
  // Declarando una varible generica para almacenar mi nombre y apellido
  var myName = 'Arturin';
  String myLastName = "Aguilar";
  final int myDNI = 210716;
  late final int myAge;
  
  // Corregir mi nombre
  myName = 'Arturo';
  //myDNI = 321321; Esto ocasiono un error por que la variable esta definida como final, ya no puede ser mutable
    
  print('Hola, $myName $myLastName, tu matricula es: $myDNI, y tu edad aun no la conozco, por que no se cuando naciste.');
  
  // Interpolando el valor de las variables con metodos de manipulacion o transformacion
  print('\nHola, ${myName.toUpperCase()} ${myLastName.toUpperCase()}, tu matricula es: $myDNI y tu edad aun no la conozco, por que no se cuando naciste.');
}