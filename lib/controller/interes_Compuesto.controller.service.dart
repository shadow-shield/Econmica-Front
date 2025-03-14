import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:transifox/model/interes_Compuesto.module.dart';

import 'package:transifox/service/interes_compuesto.module.service.dart';




class IntereCompuestoController extends GetxController {
  InteresCompuestoService gestionCompuesto = InteresCompuestoService();

  Future<String> registrarCompuesto(InteresCompuesto interesCompuesto) async {
    try {
      return await gestionCompuesto.registrarInteresCompuesto(interesCompuesto);
    } catch (e) {
      return 'Erro al registro Interes Compuesto ${e}';
    }
  }

  
}
