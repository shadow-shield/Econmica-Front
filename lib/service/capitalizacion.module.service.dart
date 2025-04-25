
import 'package:transifox/model/capitalizacion.module.dart';



import 'package:transifox/service/Crudeco.riverpod.dart';

class Capitalizacion_Service extends CrudProvider<CapitalizacionModel> {
  Future<double> registrarCapitalizacion(CapitalizacionModel capitalizacionRe) async {
    try {
      return await obtenerDouble(capitalizacionRe, 'CalcularCapitalizacion');
    } catch (e) {
       return 0.0;
    }
  }
}
