import 'package:transifox/model/amortizacion.module.dart';

import 'package:transifox/service/Crudeco.riverpod.dart';

class AmortizacionService extends CrudProvider<AmortizacionModel> {
  Future<List<Map<String, dynamic>>> registrarAmortizacion(
      AmortizacionModel amortizacionRe) async {
    try {
      return await ListaSimple(amortizacionRe, 'CalcularAmortizacion');
    } catch (e) {
      return [
        {
          "Cedula": '1010',
          "Clave": '12455',
          "Email": 'null@gmail',
          "error": 'Error al agregar el elemento: $e'
        }
      ];
    }
  }
}
