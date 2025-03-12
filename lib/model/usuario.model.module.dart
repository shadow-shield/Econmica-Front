//model usuario
class Usuario{
  late String cedula;
  late String clave;
  late String correo;


  Usuario({required this.cedula, required this.clave, required this.correo,});

  Usuario.fromJson(Map<String, dynamic> json){
    cedula = json['nombre'];
    clave = json['clave'];
    correo = json['correo'];
    
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cedula'] = this.cedula;
    data['clave'] = this.clave;
    data['correo'] = this.correo;
    return data;
  }

  @override
  String toString() {
    return 'Usuario{idUsuario: $cedula, }';
  }
}