import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Conversor C/F',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: const ConversionPage(title: 'Conversor de Temperatura'),
    );
  }
}

class ConversionPage extends StatefulWidget {
  const ConversionPage({super.key, required this.title});

  final String title;

  @override
  State<ConversionPage> createState() => _ConversionPageState();
}

class _ConversionPageState extends State<ConversionPage> {
  // Estado para el valor de entrada y el resultado
  final TextEditingController _inputController = TextEditingController();
  String _result = 'Esperando entrada...';
  
  // Lógica: Convierte Celsius a Fahrenheit
  void _calculateFahrenheit() {
    setState(() {
      try {
        final double celsius = double.parse(_inputController.text);
        // Fórmula: F = C * 9/5 + 32
        final double fahrenheit = (celsius * 9 / 5) + 32;
        // Formatear el resultado a una cadena con un decimal (ej: "212.0")
        _result = fahrenheit.toStringAsFixed(1);
      } catch (e) {
        _result = 'Error: Entrada inválida';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Ingresa la temperatura en Celsius:',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),
              
              // 1. CAMPO DE TEXTO CON KEY (Identificador para la prueba)
              TextField(
                key: const Key('celsiusInput'), 
                controller: _inputController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Valor en °C',
                ),
              ),
              
              const SizedBox(height: 32),
              
              // 2. BOTÓN DE CALCULAR CON EL TEXTO REQUERIDO "Calcular"
              ElevatedButton(
                onPressed: _calculateFahrenheit,
                child: const Text('Calcular'),
              ),
              
              const SizedBox(height: 32),
              
              const Text('Resultado en Fahrenheit:', style: TextStyle(fontSize: 16)),
              
              // 3. WIDGET DE TEXTO PARA MOSTRAR EL RESULTADO
              Text(
                _result, 
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}