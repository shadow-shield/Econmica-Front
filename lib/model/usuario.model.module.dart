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
<<<<<<< HEAD
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['cedula'] = cedula;
    data['clave'] = clave;
    data['cuenta'] = cuenta;
=======
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['cedula'] = this.cedula;
    data['clave'] = this.clave;
    data['cuenta'] = this.cuenta;
>>>>>>> 2e1885980043156a74dc70922b6175dc212e620b
    return data;
  }

  @override
  String toString() {
    return 'UsuarioModel{idUsuario: $id, }';
  }
}