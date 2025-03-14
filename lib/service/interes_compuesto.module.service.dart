import 'package:transifox/model/interes_Compuesto.module.dart';


import 'package:transifox/service/Crudeco.riverpod.dart';

class InteresCompuestoService extends CrudProvider<InteresCompuesto> {
  Future<Map<String, dynamic>> registrarInteresCompuesto(InteresCompuesto interesComRe) async {
    try {
      return await calcular(interesComRe, 'CalcularOperacionesInteresCompuesto');
    } catch (e) {
      return {"Cedula": '1010',"Clave": '12455',"Email": 'null@gmail' };
    }
  }
}
