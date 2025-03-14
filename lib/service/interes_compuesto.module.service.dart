import 'package:transifox/model/interes_Compuesto.module.dart';


import 'package:transifox/service/Crudeco.riverpod.dart';

class InteresCompuestoService extends CrudProvider<InteresCompuesto> {
  Future<String> registrarInteresCompuesto(InteresCompuesto interesComRe) async {
    try {
      return await agregar(interesComRe, 'CalcularOperacionesInteresCompuesto');
    } catch (e) {
      return "Error al Registrar el Interes Compuesto";
    }
  }
}
