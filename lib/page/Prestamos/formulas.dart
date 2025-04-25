import 'dart:math';

double calcularInteresSimple(double capital, double tasa, int tiempo) {
  return capital * (1 + (tasa / 100) * tiempo);
}

double calcularInteresCompuesto(double capital, double tasa, int tiempo) {
  return capital * pow((1 + (tasa / 100)), tiempo);
}

double calcularAnualidades(double capital, double tasa, int tiempo) {
  double r = tasa / 100;
  return capital * ((pow(1 + r, tiempo) - 1) / r);
}

double calcularAmortizacion(double capital, double tasa, int tiempo) {
  double r = tasa / 100;
  return capital * r / (1 - pow(1 + r, -tiempo));
}

double calcularGradienteAritmetico(double g, double tasa, int n) {
  double r = tasa / 100;
  return g * ((1 / r) - (n / (pow(1 + r, n) - 1)));
}

double calcularGradienteGeometrico(double a, double tasa, int n) {
  double r = tasa / 100;
  double g = 0.05;
  return a * ((1 - pow(1 + g, n)) / (1 - (1 + g) / (1 + r)));
}

double calcularCapitalizacion(double capital, double tasa, int n) {
  double r = tasa / 100;
  return capital * pow((1 + r), n);
}

double calcularInteresRetorno(
    double inversionInicial, double tasa, int tiempo) {
  double r = tasa / 100;
  return inversionInicial * pow(1 + r, tiempo);
}
