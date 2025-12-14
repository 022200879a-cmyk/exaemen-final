// lib/temperature_screen.dart

import 'package:flutter/material.dart';
import 'converter.dart'; // Importamos la lógica

class TemperatureConverterScreen extends StatefulWidget {
  const TemperatureConverterScreen({super.key});

  @override
  State<TemperatureConverterScreen> createState() => _TemperatureConverterScreenState();
}

class _TemperatureConverterScreenState extends State<TemperatureConverterScreen> {
  final TextEditingController _controller = TextEditingController();
  String _resultado = 'Ingrese temperatura';

  void _convertir() {
    final celsius = double.tryParse(_controller.text);
    if (celsius != null) {
      final fahrenheit = convertirCelsius(celsius);
      // Formateamos la salida para asegurar que sea '32.0' (tal como pide el test)
      _resultado = fahrenheit.toStringAsFixed(1);
    } else {
      _resultado = 'Error';
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Convertidor de Temperatura")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              key: const Key('inputField'), // <-- Key para la prueba de widget
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Grados Celsius (C)'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              key: const Key('convertButton'), // <-- Key para la prueba de widget
              onPressed: _convertir,
              child: const Text('Convertir'),
            ),
            const SizedBox(height: 20),
            Text(
              // Aquí se muestra el resultado
              _resultado,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}