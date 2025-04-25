//model usuario


class GradientesModel {
  late double? ValorPresente;
  late double? PagoBase;
  late double? TasaInteres;
  late double? NumeroPeriodos;
  late double? TasaCrecimiento;
  late double? ValorFuturo;
  late String? Tipo;


  GradientesModel({
    required this.ValorPresente,
     required this.PagoBase,
    required this.TasaInteres,
    required this.NumeroPeriodos,
    required this.TasaCrecimiento,
    required this.ValorFuturo,
    required this.Tipo,
  });

  GradientesModel.fromJson(Map<String, dynamic> json) {
    ValorPresente = json['ValorPresente'];
    PagoBase = json['PagoBase'];
    TasaInteres = json['TasaInteres'];
    NumeroPeriodos = json['NumeroPeriodos'];
    TasaCrecimiento = json['TasaCrecimiento'];
    ValorFuturo = json['ValorFuturo'];
    Tipo = json['Tipo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ValorPresente'] = ValorPresente;
    data['PagoBase'] = PagoBase;
    data['TasaInteres'] = TasaInteres;
    data['NumeroPeriodos'] = NumeroPeriodos;
    data['TasaCrecimiento'] = TasaCrecimiento;
    data['ValorFuturo'] = ValorFuturo;
    data['Tipo'] = Tipo;
    return data;
  }
}

