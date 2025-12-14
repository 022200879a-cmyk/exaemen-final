// test/widget_test.dart

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../lib/temperature_screen.dart'; 

void main() {
  testWidgets('Prueba de Widget: Ingresar 0 debe mostrar 32.0', (WidgetTester tester) async {
    // 1. Cargar la aplicación
    await tester.pumpWidget(const MaterialApp(home: TemperatureConverterScreen()));

    // Finders usando los Keys definidos en temperature_screen.dart
    final inputFieldFinder = find.byKey(const Key('inputField'));
    final convertButtonFinder = find.byKey(const Key('convertButton'));

    // A. Ingrese el número "0" en el campo (tester.enterText())
    await tester.enterText(inputFieldFinder, '0');
    await tester.pump(); // Actualizar después de la entrada de texto

    // B. Presione el botón (tester.tap())
    await tester.tap(convertButtonFinder);

    // Es crucial usar pumpAndSettle() o pump() después del tap para que setState()
    // en el widget se complete y el nuevo texto ("32.0") aparezca en pantalla.
    await tester.pump(); 
    // Nota: Para mayor seguridad, podrías usar tester.pumpAndSettle();

    // C. Verifique que el texto "32.0" aparezca en pantalla (expect())
    expect(find.text('32.0'), findsOneWidget); 
    
    // Opcional: Verificar que el texto inicial haya desaparecido
    expect(find.text('Ingrese temperatura'), findsNothing);
  });
}