import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

// Importa el archivo principal de tu aplicación usando el nombre correcto de tu paquete:
import '../lib/main.dart' as app;

void main() {
  // Inicializa el enlace de prueba de integración.
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Prueba de Integración: Flujo de Conversión C/F', () {
    testWidgets('Simular la entrada de "100" y verificar el resultado "212.0"',
        (WidgetTester tester) async {
      
      // Inicia la aplicación completa.
      app.main();

      // Espera a que los widgets estén construidos.
      await tester.pumpAndSettle();

      // --- 1. ENCONTRAR Y ESCRIBIR EN EL CAMPO DE TEXTO ---
      
      // Encuentra el TextField usando la Key('celsiusInput') de main.dart.
      final inputField = find.byKey(const Key('celsiusInput'));

      // Simula que el usuario escribe "100"
      await tester.enterText(inputField, '100');

      // --- 2. ENCONTRAR Y PRESIONAR EL BOTÓN ---
      
      // Encuentra el botón por su texto "Calcular".
      final calculateButton = find.text('Calcular');

      // Simula que el usuario presiona el botón.
      await tester.tap(calculateButton);
      
      // 3. Espera a que el cálculo se procese y la UI se actualice.
      await tester.pumpAndSettle();

      // --- 4. VERIFICAR EL RESULTADO ---

      // Verifica que el resultado esperado ("212.0") sea visible.
      final resultText = find.text('212.0');
      expect(resultText, findsOneWidget);
    });
  });
}