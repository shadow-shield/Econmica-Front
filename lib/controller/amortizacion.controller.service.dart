import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:transifox/model/amortizacion.module.dart';
import 'package:transifox/service/amortizacion.module.service.dart';

class Amortizacion_Controller extends GetxController {
  AmortizacionService gestionAmortizacion = AmortizacionService();

  Future<List<Map<String, dynamic>>> registrarAmortizacion(
      AmortizacionModel amortizacion) async {
    try {
      return await gestionAmortizacion.registrarAmortizacion(amortizacion);
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
