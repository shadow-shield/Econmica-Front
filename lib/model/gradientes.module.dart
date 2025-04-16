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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ValorPF'] = ValorPF;
    data['Primera_Cuota'] = Primera_Cuota;
    data['Constante_Incremento'] = Constante_Incremento;
    data['Tasa_Periodo'] = Tasa_Periodo;
    data['Numero_Pago'] = Numero_Pago;
    data['Variable_Porcentual'] = Variable_Porcentual;
    return data;
  }
}

