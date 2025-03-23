//model usuario


class AmortizacionModel {
  late double? Cuota_Periodica;
  late double? Capital_Prestado;
  late double? Tasa_Periodo;
  late double? Numero_Periodo;
  late double? Cuota_Fija;
  late double? Cuota_Interes;
  late double? Cuota_Total;
  


  AmortizacionModel({
    required this.Cuota_Periodica,
     required this.Capital_Prestado,
    required this.Tasa_Periodo,
    required this.Numero_Periodo,
    required this.Cuota_Fija,
     required this.Cuota_Interes,
      required this.Cuota_Total,
    });


  AmortizacionModel.fromJson(Map<String, dynamic> json) {
    Cuota_Periodica = json['Cuota_Periodica'];
    Capital_Prestado = json['Capital_Prestado'];
    Tasa_Periodo = json['Tasa_Periodo'];
    Numero_Periodo = json['Numero_Periodo'];
    Cuota_Fija = json['Cuota_Fija'];
    Cuota_Interes = json['Cuota_Interes'];
    Cuota_Total = json['Cuota_Total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Cuota_Periodica'] = this.Cuota_Periodica;
    data['Capital_Prestado'] = this.Capital_Prestado;
    data['Tasa_Periodo'] = this.Tasa_Periodo;
    data['Numero_Periodo'] = this.Numero_Periodo;
    data['Cuota_Fija'] = this.Cuota_Fija;
    data['Cuota_Interes'] = this.Cuota_Interes;
    data['Cuota_Total'] = this.Cuota_Total;
    return data;
  }
}

