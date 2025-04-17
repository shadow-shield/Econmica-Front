//model usuario

class AmortizacionModel {
  late double? Cuota_Periodica;
  late double? Capital_Prestado;
  late double? Tasa_Periodo;
  late double? Numero_Pagos;
  late double? Interes_Periodo;

  AmortizacionModel({
    required this.Cuota_Periodica,
    required this.Capital_Prestado,
    required this.Tasa_Periodo,
    required this.Numero_Pagos,
    required this.Interes_Periodo,
  });

  AmortizacionModel.fromJson(Map<String, dynamic> json) {
    Cuota_Periodica = json['Cuota_Periodica'];
    Capital_Prestado = json['Capital_Prestado'];
    Tasa_Periodo = json['Tasa_Periodo'];
    Numero_Pagos = json['Numero_Pagos'];
    Interes_Periodo = json['Interes_Periodo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Cuota_Periodica'] = Cuota_Periodica;
    data['Capital_Prestado'] = Capital_Prestado;
    data['Tasa_Periodo'] = Tasa_Periodo;
    data['Numero_Periodo'] = Numero_Pagos;
    data['Interes_Periodo'] = Interes_Periodo;

    return data;
  }
}
