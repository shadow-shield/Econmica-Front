import 'package:transifox/model/interes_retorno.module.dart';

import 'package:transifox/service/Crudeco.riverpod.dart';

class Tasa_RetornoService extends CrudProvider<Tasa_Retorno> {
  Future<Map<String, dynamic>> registrarRetorno(Tasa_Retorno retornoRe) async {
    try {
      return await calcular(retornoRe, 'CalcularRetorno');
    } catch (e) {
      return {
        "Tasa_Anualidad": '14050',
        "Monto_Anualidad": '12455',
        "Periodos_Capitalizacion": '112455'
      };
    }
  }
}
