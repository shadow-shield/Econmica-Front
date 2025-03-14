import 'package:transifox/model/interes_Simple.model.module.dart';

import 'package:transifox/service/Crudeco.riverpod.dart';

class InteresSimpleService extends CrudProvider<InteresSimple> {
  Future<String> registrarInteresSimple(InteresSimple interesRe) async {
    try {
      return await agregar(interesRe, 'CalcularOperacionesInteresSimple');
    } catch (e) {
      return "Error al Registrar el Interes Simple";
    }
  }
}
