//model usuario


class InteresCompuesto {
  late double? Monto_Compuesto;
  late double? Capital;
  late double? Tasa_Interes;
  late double? Tiempo;
  late double? Interes_Compuesto;

  InteresCompuesto({
    required this.Monto_Compuesto,
    required this.Capital,
    required this.Tasa_Interes,
    required this.Tiempo,
    required this.Interes_Compuesto,
  });

  InteresCompuesto.fromJson(Map<String, dynamic> json) {
    Monto_Compuesto = json['Monto_Compuesto'];
    Capital = json['Capital'];
    Tasa_Interes = json['Tasa_Interes'];
    Tiempo = json['Tiempo'];
    Interes_Compuesto = json['Interes_Compuesto'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Monto_Compuesto'] = this.Monto_Compuesto;
    data['Capital'] = this.Capital;
    data['Tasa_Interes'] = this.Tasa_Interes;
    data['Tiempo'] = this.Tiempo;
    data['Interes_Compuesto'] = this.Interes_Compuesto;
    return data;
  }
}

