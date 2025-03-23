//model usuario


class CapitalizacionModel {
  late double? Capital_Inicial;
  late double? Capital_Final;
  late double? Tasa_Interes;
  late double? Tiempo;


  CapitalizacionModel({
    required this.Capital_Inicial,
    required this.Capital_Final,
    required this.Tasa_Interes,
    required this.Tiempo,

  });

  CapitalizacionModel.fromJson(Map<String, dynamic> json) {
    Capital_Inicial = json['Capital_Inicial'];
    Capital_Final = json['Capital_Final'];
    Tasa_Interes = json['Tasa_Interes'];
    Tiempo = json['Tiempo'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Capital_Inicial'] = this.Capital_Inicial;
    data['Capital_Final'] = this.Capital_Final;
    data['Tasa_Interes'] = this.Tasa_Interes;
    data['Tiempo'] = this.Tiempo;

    return data;
  }
}
