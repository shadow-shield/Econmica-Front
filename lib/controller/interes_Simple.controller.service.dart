import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:transifox/model/interes_Simple.model.module.dart';

import 'package:transifox/service/interes_simple.module.service.dart';


class IntereSimpleController extends GetxController {
  InteresSimpleService gestionSimple = InteresSimpleService();

  Future<Map<String, dynamic>> registrarInteres(InteresSimple interessimpleRe) async {
    try {
      return await gestionSimple.registrarInteresSimple(interessimpleRe);
    } catch (e) {
        return {"Cedula": '1010',"Clave": '12455',"Email": 'null@gmail' };
    }
  }

  
}
