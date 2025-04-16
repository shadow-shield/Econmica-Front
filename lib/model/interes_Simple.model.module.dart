//model usuario


class InteresSimple {
  late double? Monto;
  late double? Capital;
  late double? Tasa_Interes;
  late double? Tiempo;
  late double? Interes_Simple;

  InteresSimple({
    required this.Monto,
    required this.Capital,
    required this.Tasa_Interes,
    required this.Tiempo,
    required this.Interes_Simple,
  });

  InteresSimple.fromJson(Map<String, dynamic> json) {
    Monto = json['Monto'];
    Capital = json['Capital'];
    Tasa_Interes = json['Tasa_Interes'];
    Tiempo = json['Tiempo'];
    Interes_Simple = json['Interes_Simple'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Monto'] = Monto;
    data['Capital'] = Capital;
    data['Tasa_Interes'] = Tasa_Interes;
    data['Tiempo'] = Tiempo;
    data['Interes_Simple'] = Interes_Simple;
    return data;
  }
}
