class Prestamo {
  final DateTime fecha;
  final double monto;
  final double tasa;
  final int plazo;
  final String tipoInteres;
  final double interes;
  final double totalPagar;
  final double cuotaAnual;

  Prestamo({
    required this.fecha,
    required this.monto,
    required this.tasa,
    required this.plazo,
    required this.tipoInteres,
    required this.interes,
    required this.totalPagar,
    required this.cuotaAnual,
  });
}