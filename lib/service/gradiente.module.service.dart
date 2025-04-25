import 'package:transifox/model/gradientes.module.dart';

import 'package:transifox/service/Crudeco.riverpod.dart';

class GradienteService extends CrudProvider<GradientesModel> {
  Future<double> registrarGradientAritmetico(
      GradientesModel agredienteRe) async {
    try {
      return await obtenerDouble(agredienteRe, 'CalcularGradienteAritmetico');
    } catch (e) {
      return 0.0;
    }
  }

  Future<double> registrarGradientGeometrico(
      GradientesModel agredienteRe) async {
    try {
      return await obtenerDouble(agredienteRe, 'CalcularGradienteGeometrico');
    } catch (e) {
      return 0.0;
    }
  }
}
