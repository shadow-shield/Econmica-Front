import 'package:flutter/material.dart';
import 'package:transifox/model/prestamo.module.dart';
import 'package:transifox/page/Prestamos/formulas.dart';
import 'package:intl/intl.dart';

class CalculadoraPrestamos extends StatefulWidget {
  const CalculadoraPrestamos({super.key});

  @override
  State<CalculadoraPrestamos> createState() => _CalculadoraPrestamosState();
}

class _CalculadoraPrestamosState extends State<CalculadoraPrestamos> {
  final boxDecoration = BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.bottomLeft,
      end: Alignment.topRight,
      stops: const [0.2, 0.9],
      colors: [
        Colors.white,
        Colors.brown[400]!,
      ],
    ),
  );
  final TextEditingController _montoController = TextEditingController();
  final TextEditingController _tasaController = TextEditingController();
  final TextEditingController _plazoController = TextEditingController();
  String _tipoInteres = 'Simple';
  String _resultado = '';
  final List<Prestamo> _historial = [];

  void calcular() {
    double monto = double.tryParse(_montoController.text) ?? 0;
    double tasa = double.tryParse(_tasaController.text) ?? 0;
    int plazo = int.tryParse(_plazoController.text) ?? 0;

    double resultado = 0;
    switch (_tipoInteres) {
      case 'Simple':
        resultado = calcularInteresSimple(monto, tasa, plazo);
        break;
      case 'Compuesto':
        resultado = calcularInteresCompuesto(monto, tasa, plazo);
        break;
      case 'Anualidad':
        resultado = calcularAnualidades(monto, tasa, plazo);
        break;
      case 'Amortización':
        resultado = calcularAmortizacion(monto, tasa, plazo);
        break;
      case 'Gradiente Aritmético':
        resultado = calcularGradienteAritmetico(monto, tasa, plazo);
        break;
      case 'Gradiente Geométrico':
        resultado = calcularGradienteGeometrico(monto, tasa, plazo);
        break;
      case 'Capitalización':
        resultado = calcularCapitalizacion(monto, tasa, plazo);
        break;
      case 'Interés de Retorno':
        resultado = calcularInteresRetorno(monto, tasa, plazo);
        break;
    }

    double totalPago = monto + resultado;
    double cuotaAnual = totalPago / plazo;

    Prestamo nuevoPrestamo = Prestamo(
      fecha: DateTime.now(),
      monto: monto,
      tasa: tasa,
      plazo: plazo,
      tipoInteres: _tipoInteres,
      interes: resultado,
      totalPagar: totalPago,
      cuotaAnual: cuotaAnual,
    );

    setState(() {
      _resultado = 'Interés: \$${resultado.toStringAsFixed(2)}\n'
          'Total a pagar: \$${totalPago.toStringAsFixed(2)}\n'
          'Pago anual aproximado: \$${cuotaAnual.toStringAsFixed(2)}';
      _historial.add(nuevoPrestamo);
    });
  }

  InputDecoration _inputDecoration(String label, IconData icon) {
    return InputDecoration(
      labelText: label,
      labelStyle:
          TextStyle(color: Colors.blue[800]!), // Cambia el color del texto
      prefixIcon: Icon(
        icon,
        color: Colors.blue[800]!, // Cambia el color del ícono
      ),
      iconColor: Colors.blue[800]!, // Alternativa para cambiar color del ícono
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      filled: true,
      fillColor: Colors.white,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Simulador de Préstamos',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue[800]!,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Card(
                color: Colors.blue[800]!,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      TextField(
                        controller: _montoController,
                        keyboardType: TextInputType.number,
                        decoration:
                            _inputDecoration('Monto del préstamo', Icons.money),
                      ),
                      const SizedBox(height: 12),
                      TextField(
                        controller: _tasaController,
                        keyboardType: TextInputType.number,
                        decoration: _inputDecoration(
                            'Tasa de interés (%)', Icons.percent),
                      ),
                      const SizedBox(height: 12),
                      TextField(
                        controller: _plazoController,
                        keyboardType: TextInputType.number,
                        decoration:
                            _inputDecoration('Plazo (años)', Icons.timer),
                      ),
                      const SizedBox(height: 12),
                      DropdownButtonFormField<String>(
                        dropdownColor: Colors.white,
                        focusColor: Colors.white,
                        value: _tipoInteres,
                        items: [
                          'Simple',
                          'Compuesto',
                          'Anualidad',
                          'Amortización',
                          'Gradiente Aritmético',
                          'Gradiente Geométrico',
                          'Capitalización',
                          'Interés de Retorno'
                        ]
                            .map((e) => DropdownMenuItem(
                                value: e,
                                child: Text(
                                  e,
                                  style: const TextStyle(fontSize: 16),
                                )))
                            .toList(),
                        onChanged: (value) =>
                            setState(() => _tipoInteres = value!),
                        decoration: _inputDecoration(
                            'Tipo de interés', Icons.calculate),
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton.icon(
                          icon: Icon(Icons.check_circle,
                              color: Colors.blue[800]!),
                          onPressed: calcular,
                          label: Text('Calcular',
                              style: TextStyle(
                                  fontSize: 18, color: Colors.blue[800]!)),
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            backgroundColor: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              if (_resultado.isNotEmpty)
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  elevation: 3,
                  color: Colors.blue[800]!,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      _resultado,
                      style: const TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              const SizedBox(height: 30),
              Text(
                'Historial de Préstamos',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue[800]!),
              ),
              const SizedBox(height: 10),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _historial.length,
                itemBuilder: (context, index) {
                  final p = _historial[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    elevation: 2,
                    child: ListTile(
                      leading: const Icon(Icons.history),
                      title: Text(
                        DateFormat('dd/MM/yyyy HH:mm').format(p.fecha),
                        style: TextStyle(color: Colors.blue[800]!),
                      ),
                      subtitle: Text(
                        'Monto: \$${p.monto.toStringAsFixed(2)}\nTipo: ${p.tipoInteres} | Plazo: ${p.plazo} años',
                        style: TextStyle(color: Colors.blue[800]!),
                      ),
                      trailing: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'Cuota: \$${p.cuotaAnual.toStringAsFixed(2)}',
                            style: TextStyle(color: Colors.blue[800]!),
                          ),
                          Text('Total: \$${p.totalPagar.toStringAsFixed(2)}',
                              style: TextStyle(color: Colors.blue[800]!)),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
