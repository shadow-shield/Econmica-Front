import 'package:transifox/model/anualidades.module.dart';


import 'package:transifox/service/Crudeco.riverpod.dart';

class AnualidadService extends CrudProvider<Anualidadmodel> {
  Future<Map<String, dynamic>> registrarAnualidad(Anualidadmodel anualidadRe) async {
    try {
      return await calcular(anualidadRe, 'CalcularAnualidades');
    } catch (e) {
       return {"Tasa_Anualidad": '14050',"Monto_Anualidad": '12455',"Periodos_Capitalizacion": '112455' };
    }
  }
}
