//model usuario


class InteresCompuesto {
  late double Monto_Anualidad;
  late double Tasa_Anualidad;
  late double Periodos_Capitalizacion;
  late double Valor_Presente;

  InteresCompuesto({
    required this.Monto_Anualidad,
    required this.Tasa_Anualidad,
    required this.Periodos_Capitalizacion,
    required this.Valor_Presente,
  });

  InteresCompuesto.fromJson(Map<String, dynamic> json) {
    Monto_Anualidad = json['Monto_Anualidad'];
    Tasa_Anualidad = json['Tasa_Anualidad'];
    Periodos_Capitalizacion = json['Periodos_Capitalizacion'];
    Valor_Presente = json['Valor_Presente'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Monto_Anualidad'] = this.Monto_Anualidad;
    data['Tasa_Anualidad'] = this.Tasa_Anualidad;
    data['Periodos_Capitalizacion'] = this.Periodos_Capitalizacion;
    data['Valor_Presente'] = this.Valor_Presente;
    return data;
  }
}
