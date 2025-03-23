//model usuario


class GradientesModel {
  late double? ValorPF;
  late double? Primera_Cuota;
  late double? Constante_Incremento;
  late double? Tasa_Periodo;
  late double? Numero_Pago;
  late double? Variable_Porcentual;


  GradientesModel({
    required this.ValorPF,
     required this.Primera_Cuota,
    required this.Constante_Incremento,
    required this.Tasa_Periodo,
    required this.Numero_Pago,
    required this.Variable_Porcentual,
  });

  GradientesModel.fromJson(Map<String, dynamic> json) {
    ValorPF = json['ValorPF'];
    Primera_Cuota = json['Primera_Cuota'];
    Constante_Incremento = json['Constante_Incremento'];
    Tasa_Periodo = json['Tasa_Periodo'];
    Numero_Pago = json['Numero_Pago'];
    Variable_Porcentual = json['Variable_Porcentual'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ValorPF'] = this.ValorPF;
    data['Primera_Cuota'] = this.Primera_Cuota;
    data['Constante_Incremento'] = this.Constante_Incremento;
    data['Tasa_Periodo'] = this.Tasa_Periodo;
    data['Numero_Pago'] = this.Numero_Pago;
    data['Variable_Porcentual'] = this.Variable_Porcentual;
    return data;
  }
}

