import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:transifox/model/gradientes.module.dart';
import 'package:transifox/service/gradiente.module.service.dart';

class Gradiente_Controller extends GetxController {
  GradienteService gestionGradiente = GradienteService();

  Future<Map<String, dynamic>> registrarGradiente(GradientesModel gradiente) async {
    try {
      return await gestionGradiente.registrarGradiente(gradiente);
    } catch (e) {
     return {"Cedula": '1010',"Clave": '12455',"Email": 'null@gmail' };
    }
  }

  
}
