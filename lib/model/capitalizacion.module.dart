//model usuario

class CapitalizacionModel {
  late double? Monto_final;
  late double? Capital_Inicial;
  late double? Tasa_Interes;
  late double? Tiempo;
  late double? NPeriodo;
  late double? Periodo_Inicial;

  CapitalizacionModel({
    required this.Monto_final,
    required this.Capital_Inicial,
    required this.Tasa_Interes,
    required this.Tiempo,
    required this.NPeriodo,
    required this.Periodo_Inicial,
  });

  CapitalizacionModel.fromJson(Map<String, dynamic> json) {
    Monto_final = json['Monto_final'];
    Capital_Inicial = json['Capital_Inicial'];
    Tasa_Interes = json['v'];
    Tiempo = json['Tiempo'];
    NPeriodo = json['NPeriodo'];
    Periodo_Inicial = json['Periodo_Inicial'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Capital_Inicial'] = Monto_final;
    data['Capital_Final'] = Capital_Inicial;
    data['Tasa_Interes'] = Tasa_Interes;
    data['Tiempo'] = Tiempo;
    data['NPeriodo'] = NPeriodo;
    data['Periodo_Inicial'] = Periodo_Inicial;

    return data;
  }
}
