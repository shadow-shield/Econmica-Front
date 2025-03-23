
import 'package:transifox/model/gradientes.module.dart';


import 'package:transifox/service/Crudeco.riverpod.dart';

class GradienteService extends CrudProvider<GradientesModel> {
  Future<Map<String, dynamic>> registrarGradiente(GradientesModel agredienteRe) async {
    try {
      return await calcular(agredienteRe, 'CalcularGradiente');
    } catch (e) {
       return {"Tasa_Anualidad": '14050',"Monto_Anualidad": '12455',"Periodos_Capitalizacion": '112455' };
    }
  }
}
