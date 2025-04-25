import 'package:transifox/model/interes_retorno.module.dart';

import 'package:transifox/service/Crudeco.riverpod.dart';

class Tasa_RetornoService extends CrudProvider<Tasa_Retorno> {
  Future<List<Map<String, dynamic>>> registrarRetorno(Tasa_Retorno retornoRe) async {
    try {
      return await ListaSimple(retornoRe, 'CalcularTir');
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
