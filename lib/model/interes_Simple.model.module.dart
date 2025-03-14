//model usuario
import 'dart:nativewrappers/_internal/vm/lib/ffi_native_type_patch.dart';

class InteresSimple {
  late Double Monto;
  late Double Capital;
  late Double Tasa_Interes;
  late Double Tiempo;
  late Double Interes_Simple;

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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Monto'] = this.Monto;
    data['Capital'] = this.Capital;
    data['Tasa_Interes'] = this.Tasa_Interes;
    data['Tiempo'] = this.Tiempo;
    data['Interes_Simple'] = this.Interes_Simple;
    return data;
  }
}
