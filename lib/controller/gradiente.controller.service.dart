import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:transifox/model/gradientes.module.dart';
import 'package:transifox/service/gradiente.module.service.dart';

class Gradiente_Controller extends GetxController {
  GradienteService gestionGradiente = GradienteService();

  Future<double> registrarGradienteArit(GradientesModel gradiente) async {
    try {
      return await gestionGradiente.registrarGradientAritmetico(gradiente);
    } catch (e) {
      return 0.0;
    }
  }

  Future<double> registrarGradienteGeo(GradientesModel gradiente) async {
    try {
      return await gestionGradiente.registrarGradientGeometrico(gradiente);
    } catch (e) {
      return 0.0;
    }
  }
}
