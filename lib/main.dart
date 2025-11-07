import 'package:flutter/material.dart';
import 'screens/pantalla_reportes.dart';

void main() {
  runApp(const ReportesApp());
}

class ReportesApp extends StatelessWidget {
  const ReportesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reportes App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.blue,
        ).copyWith(secondary: Colors.teal),
        useMaterial3: true,
        fontFamily: 'Inter',
      ),
      home: const PantallaReportes(),
    );
  }
}