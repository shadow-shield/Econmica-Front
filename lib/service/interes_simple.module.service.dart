import 'package:transifox/model/interes_Simple.model.module.dart';

import 'package:transifox/service/Crudeco.riverpod.dart';

class InteresSimpleService extends CrudProvider<InteresSimple> {
  Future<Map<String, dynamic>> registrarInteresSimple(InteresSimple interesRe) async {
    try {
      return await calcular(interesRe, 'CalcularOperacionesInteresSimple');
    } catch (e) {
       return {"Cedula": '1010',"Clave": '12455',"Email": 'null@gmail' };
    }
  }
}
