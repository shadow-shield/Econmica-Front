import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:transifox/page/pageecuaciones/anualidades.riverpod.dart';
import 'package:transifox/service/anualidades.module.service.dart';

import 'package:transifox/service/interes_compuesto.module.service.dart';




class AnualidadController extends GetxController {
  AnualidadService gestionAnualidad = AnualidadService();

  Future<String> registrarAnualidad(Anualidad anualidad) async {
    try {
      return await gestionAnualidad.registrarAnulidad(anualidad);
    } catch (e) {
      return 'Erro al registro la Anualidad ${e}';
    }
  }

  
}
