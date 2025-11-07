import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:reportes_app/main.dart';

void main() {
  testWidgets('Carga la app correctamente', (WidgetTester tester) async {
    // Construye la app
    await tester.pumpWidget(ReportesApp());

    // Verifica que el título del AppBar sea el correcto
    expect(find.text('Lista de Reportes'), findsOneWidget);

    // Verifica que el indicador de carga se muestre al inicio
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });
}