import 'package:transifox/page/pageecuaciones/anualidades.riverpod.dart';

import 'package:transifox/service/Crudeco.riverpod.dart';

class AnualidadService extends CrudProvider<Anualidad> {
  Future<String> registrarAnulidad(Anualidad anualidad) async {
    try {
      return await agregar(anualidad, 'CalcularAnualidades');
    } catch (e) {
      return "Error al Registrar la Anualidad";
    }
  }
}
