//model usuario


class Anualidadmodel {
  late double? Monto_Fijo;
  late double? Tasa_Anualidad;
  late double? Periodos_Capitalizacion;
  late double? Valor_Presente;
  late double? Valor_Futuro;

  Anualidadmodel({
    required this.Monto_Fijo,
    required this.Tasa_Anualidad,
    required this.Periodos_Capitalizacion,
    required this.Valor_Presente,
    required this.Valor_Futuro,
  });

  Anualidadmodel.fromJson(Map<String, dynamic> json) {
    Monto_Fijo = json['Monto_Fijo'];
    Tasa_Anualidad = json['Tasa_Anualidad'];
    Periodos_Capitalizacion = json['Periodos_Capitalizacion'];
    Valor_Presente = json['Valor_Presente'];
    Valor_Futuro = json['Valor_Futuro'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Monto_Fijo'] = this.Monto_Fijo;
    data['Tasa_Anualidad'] = this.Tasa_Anualidad;
    data['Periodos_Capitalizacion'] = this.Periodos_Capitalizacion;
    data['Valor_Presente'] = this.Valor_Presente;
    data['Valor_Futuro'] = this.Valor_Futuro;
    return data;
  }

   
}
