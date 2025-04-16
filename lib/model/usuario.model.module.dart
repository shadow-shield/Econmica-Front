//model usuario
class Usuario {
  late String Email;
  late String Cedula;
  late String Clave;

  Usuario({
    required this.Email,
    required this.Cedula,
    required this.Clave,
  });

  Usuario.fromJson(Map<String, dynamic> json) {
    Email = json['Email'];
    Cedula = json['Cedula'];
    Clave = json['Clave'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Email'] = Email;
    data['Cedula'] = Cedula;
    data['Clave'] = Clave;
    return data;
  }

  @override
  String toString() {
    return 'Usuario{idUsuario: $Cedula, }';
  }
}
