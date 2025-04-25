//model usuario

class CapitalizacionModel {
  late double? Capital;
  late double? Tasa_Interes;
  late double? Tiempo;
  late double? TiempoDiferido;
  late double? CapitalizacionesAnio;
  late String? Tipo;

  CapitalizacionModel({
    required this.Capital,
    required this.CapitalizacionesAnio,
    required this.Tasa_Interes,
    required this.Tiempo,
    required this.TiempoDiferido,
    required this.Tipo,
  });

  CapitalizacionModel.fromJson(Map<String, dynamic> json) {
    Capital = json['Capital'];
    Tasa_Interes = json['Tasa_Interes'];
    Tiempo = json['Tiempo'];
    TiempoDiferido = json['TiempoDiferido'];
    CapitalizacionesAnio = json['CapitalizacionesAnio'];
    Tipo = json['Tipo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['CapitalizacionesAnio'] = CapitalizacionesAnio;
    data['Capital'] = Capital;
    data['Tasa_Interes'] = Tasa_Interes;
    data['Tiempo'] = Tiempo;
    data['TiempoDiferido'] = TiempoDiferido;
    data['Tipo'] = Tipo;

    return data;
  }
}
