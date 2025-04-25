//model usuario

class Tasa_Retorno {
  late double? Monto;
  late double? NumeroPeriodos;
  late List<int>? FlujosPorPeriodo;

  Tasa_Retorno({
    required this.Monto,
    required this.NumeroPeriodos,
    required this.FlujosPorPeriodo,
  });

  Tasa_Retorno.fromJson(Map<String, dynamic> json) {
    Monto = json['Monto'];
    NumeroPeriodos = json['NumeroPeriodos'];
    FlujosPorPeriodo = json['FlujosPorPeriodo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Monto'] = Monto;
    data['NumeroPeriodos'] = NumeroPeriodos;
    data['FlujosPorPeriodo'] = FlujosPorPeriodo;

    return data;
  }
}
