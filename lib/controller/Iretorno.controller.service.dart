import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:transifox/model/interes_retorno.module.dart';
import 'package:transifox/service/Iretorno.module.service.dart';

class IRetorno_Controller extends GetxController {
  Tasa_RetornoService gestionGradiente = Tasa_RetornoService();

  Future<List<Map<String, dynamic>>> registrarRetorno(
      Tasa_Retorno retorno) async {
    try {
      return await gestionGradiente.registrarRetorno(retorno);
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
