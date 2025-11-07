import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:reportes_app/main.dart';

void main() {
  testWidgets('Carga la app correctamente', (WidgetTester tester) async {
    
    await tester.pumpWidget(ReportesApp());

    
    expect(find.text('Lista de Reportes'), findsOneWidget);

    
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });
}