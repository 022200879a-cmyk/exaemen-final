// test/unit_test.dart

import 'package:flutter_test/flutter_test.dart';
import '../lib/converter.dart'; // Asegúrate de que la ruta sea correcta

void main() {
  test('Prueba Unitaria: 0 C debe ser 32 F', () {
    // 1. Ejecutar la función con 0
    final resultado = convertirCelsius(0);

    // 2. Verificar que el resultado sea exactamente 32.0
    expect(resultado, 32.0);
  });
}