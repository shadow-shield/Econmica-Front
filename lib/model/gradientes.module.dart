//model usuario


class GradientesModel {
  late double? ValorPF;
  late double? Primera_Pago;
  late double? Tasa_Interes;
  late double? Numero_Periodo;
  late double? Tasa_Crecimiento;
  late double? Factor_Conversion;
  late double? Cuota_enPeriodo;


  GradientesModel({
    required this.ValorPF,
     required this.Primera_Pago,
    required this.Tasa_Interes,
    required this.Numero_Periodo,
    required this.Tasa_Crecimiento,
    required this.Factor_Conversion,
    required this.Cuota_enPeriodo,
  });

  GradientesModel.fromJson(Map<String, dynamic> json) {
    ValorPF = json['ValorPF'];
    Primera_Pago = json['Primera_Pago'];
    Tasa_Interes = json['Tasa_Interes'];
    Numero_Periodo = json['Numero_Periodo'];
    Tasa_Crecimiento = json['Tasa_Crecimiento'];
    Factor_Conversion = json['Factor_Conversion'];
    Cuota_enPeriodo = json['Cuota_enPeriodo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ValorPF'] = ValorPF;
    data['Primera_Pago'] = Primera_Pago;
    data['Tasa_Interes'] = Tasa_Interes;
    data['Numero_Periodo'] = Numero_Periodo;
    data['Tasa_Crecimiento'] = Tasa_Crecimiento;
    data['Factor_Conversion'] = Factor_Conversion;
    data['Cuota_enPeriodo'] = Cuota_enPeriodo;
    return data;
  }
}

