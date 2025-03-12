//model usuario
class Usuario{
  late String id;
  late String cedula;
  late String clave;
  late String cuenta;


  Usuario({required this.id, required this.cedula, required this.clave, required this.cuenta,});

  Usuario.fromJson(Map<String, dynamic> json){
    id = json['id'];
    cedula = json['nombre'];
    clave = json['clave'];
    cuenta = json['cuenta'];
    
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['cedula'] = cedula;
    data['clave'] = clave;
    data['cuenta'] = cuenta;
    return data;
  }

  @override
  String toString() {
    return 'UsuarioModel{idUsuario: $id, }';
  }
}