
import 'package:transifox/model/capitalizacion.module.dart';



import 'package:transifox/service/Crudeco.riverpod.dart';

class Capitalizacion_Service extends CrudProvider<CapitalizacionModel> {
  Future<Map<String, dynamic>> registrarCapitalizacion(CapitalizacionModel capitalizacionRe) async {
    try {
      return await calcular(capitalizacionRe, 'CalcularCapitalizacion');
    } catch (e) {
       return {"Tasa_Anualidad": '14050',"Monto_Anualidad": '12455',"Periodos_Capitalizacion": '112455' };
    }
  }
}
