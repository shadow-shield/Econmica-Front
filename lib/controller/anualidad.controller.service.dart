import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:transifox/model/anualidades.module.dart';
import 'package:transifox/page/pageecuaciones/anualidades.riverpod.dart';
import 'package:transifox/service/anualidades.module.service.dart';

class AnualidadController extends GetxController {
  AnualidadService gestionAnualidad = AnualidadService();

  Future<Map<String, dynamic>> registrarAnualidades(Anualidadmodel anualidad) async {
    try {
      return await gestionAnualidad.registrarAnualidad(anualidad);
    } catch (e) {
      return {
        "Tasa_Anualidad": '14050',
        "Monto_Anualidad": '12455',
        "Periodos_Capitalizacion": '112455'
      };
    }
  }
}
