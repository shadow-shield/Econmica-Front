//model usuario


class Tasa_Retorno {
  late double? Flujo_Caja;
  late double? Periodo_Tiempo;
  late double? Numero_Periodo;
  late double? TasaInteres_Retorno;


  Tasa_Retorno({
    required this.Flujo_Caja,
    required this.Periodo_Tiempo,
    required this.Numero_Periodo,
    required this.TasaInteres_Retorno,

  });

  Tasa_Retorno.fromJson(Map<String, dynamic> json) {
    Flujo_Caja = json['Capital_Inicial'];
    Periodo_Tiempo = json['Capital_Final'];
    Numero_Periodo = json['Tasa_Interes'];
    TasaInteres_Retorno = json['TasaInteres_Retorno'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Monto'] = this.Flujo_Caja;
    data['Capital'] = this.Periodo_Tiempo;
    data['Tasa_Interes'] = this.Numero_Periodo;
    data['TasaInteres_Retorno'] = this.TasaInteres_Retorno;

    return data;
  }
}
