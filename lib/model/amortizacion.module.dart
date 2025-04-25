//model usuario

class AmortizacionModel {
  late double? Monto;
  late double? TasaInteres;
  late double? Plazo;
  late String? Tipo;


  AmortizacionModel({
    required this.Monto,
    required this.TasaInteres,
    required this.Plazo,
    required this.Tipo,

  });

  AmortizacionModel.fromJson(Map<String, dynamic> json) {
    Monto = json['Monto'];
    TasaInteres = json['TasaInteres'];
    Plazo = json['Plazo'];
    Tipo = json['Tipo'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Monto'] = Monto;
    data['TasaInteres'] = TasaInteres;
    data['Plazo'] = Plazo;
    data['Tipo'] = Tipo;


    return data;
  }
}
