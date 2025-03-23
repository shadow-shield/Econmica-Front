import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:transifox/model/capitalizacion.module.dart';
import 'package:transifox/service/capitalizacion.module.service.dart';

class Capitalizacion_Controller extends GetxController {
  Capitalizacion_Service gestionCapitalizacion = Capitalizacion_Service();

  Future<Map<String, dynamic>> registrarCapitalizacion(CapitalizacionModel capitalizacion) async {
    try {
      return await gestionCapitalizacion.registrarCapitalizacion(capitalizacion);
    } catch (e) {
     return {"Cedula": '1010',"Clave": '12455',"Email": 'null@gmail' };
    }
  }

  
}
