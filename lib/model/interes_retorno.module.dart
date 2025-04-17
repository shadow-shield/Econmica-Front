//model usuario

class Tasa_Retorno {
  late double? Inversion_Inicial;
  late double? Flujo_Caja;
  late double? Tasa_Interes;
  late double? Periodo_especifico;
  late double? Numero_Periodos;

  Tasa_Retorno({
    required this.Inversion_Inicial,
    required this.Flujo_Caja,
    required this.Tasa_Interes,
    required this.Periodo_especifico,
    required this.Numero_Periodos,
  });

  Tasa_Retorno.fromJson(Map<String, dynamic> json) {
    Inversion_Inicial = json['Inversion_Inicial'];
    Flujo_Caja = json['Flujo_Caja'];
    Tasa_Interes = json['Tasa_Interes'];
    Periodo_especifico = json['Periodo_especifico'];
    Numero_Periodos = json['Numero_Periodos'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Inversion_Inicial'] = Inversion_Inicial;
    data['Flujo_Caja'] = Flujo_Caja;
    data['Tasa_Interes'] = Tasa_Interes;
    data['Periodo_especifico'] = Periodo_especifico;
    data['Numero_Periodos'] = Numero_Periodos;

    return data;
  }
}
