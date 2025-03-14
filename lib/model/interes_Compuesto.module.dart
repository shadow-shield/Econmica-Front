//model usuario
import 'dart:nativewrappers/_internal/vm/lib/ffi_native_type_patch.dart';

class InteresCompuesto {
  late Double Monto_Compuesto;
  late Double Capital;
  late Double Tasa_Interes;
  late Double Tiempo;
  late Double Interes_Compuesto;

  InteresCompuesto({
    required this.Monto_Compuesto,
    required this.Capital,
    required this.Tasa_Interes,
    required this.Tiempo,
    required this.Interes_Compuesto,
  });

  InteresCompuesto.fromJson(Map<String, dynamic> json) {
    Monto_Compuesto = json['Monto'];
    Capital = json['Capital'];
    Tasa_Interes = json['Tasa_Interes'];
    Tiempo = json['Tiempo'];
    Interes_Compuesto = json['Interes_Simple'];
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

