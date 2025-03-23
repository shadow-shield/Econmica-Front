import 'package:transifox/model/amortizacion.module.dart';



import 'package:transifox/service/Crudeco.riverpod.dart';

class AmortizacionService extends CrudProvider<AmortizacionModel> {
  Future<Map<String, dynamic>> registrarAmortizacion(AmortizacionModel amortizacionRe) async {
    try {
      return await calcular(amortizacionRe, 'CalcularAmortizacion');
    } catch (e) {
       return {"Tasa_Anualidad": '14050',"Monto_Anualidad": '12455',"Periodos_Capitalizacion": '112455' };
    }
  }
}
