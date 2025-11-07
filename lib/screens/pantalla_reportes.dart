import 'package:flutter/material.dart';
import '../models/report.dart';
import '../widgets/report_card.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_input.dart';

class PantallaReportes extends StatefulWidget {
  const PantallaReportes({super.key});

  @override
  State<PantallaReportes> createState() => _PantallaReportesState();
}

class _PantallaReportesState extends State<PantallaReportes> {
  final List<Report> _reportes = [
    Report(
      id: '1',
      nombreUsuario: 'Enrique Castro ',
      ubicacion: 'Centro de la ciudad',
      descripcion: 'Problema con el alumbrado público en la calle principal',
      imagenUrl:
          'https://cdn-icons-png.flaticon.com/512/685/685655.png', 
      fecha: DateTime.now().subtract(const Duration(hours: 2)),
    ),
    Report(
      id: '2',
      nombreUsuario: 'Elvira Diaz',
      ubicacion: 'Parque Central',
      descripcion:
          'Basura acumulada en el parque ',
      imagenUrl:
          'https://cdn-icons-png.flaticon.com/512/415/415733.png',
      fecha: DateTime.now().subtract(const Duration(hours: 4)),
    ),
  ];

  void _mostrarDialogoAgregar() {
    final _nombreCtrl = TextEditingController();
    final _ubicacionCtrl = TextEditingController();
    final _descripcionCtrl = TextEditingController();

    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: const Text('Nuevo reporte'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                CustomInput(label: 'Nombre', controller: _nombreCtrl),
                CustomInput(label: 'Ubicación', controller: _ubicacionCtrl),
                CustomInput(label: 'Descripción', controller: _descripcionCtrl),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancelar'),
            ),
            CustomButton(
              texto: 'Agregar',
              onPressed: () {
                setState(() {
                  _reportes.insert(
                    0,
                    Report(
                      id: DateTime.now().toString(),
                      nombreUsuario: _nombreCtrl.text,
                      ubicacion: _ubicacionCtrl.text,
                      descripcion: _descripcionCtrl.text,
                      imagenUrl: null,
                      fecha: DateTime.now(),
                    ),
                  );
                });
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reportes'),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: CustomButton(
              texto: '+ Agregar',
              onPressed: _mostrarDialogoAgregar,
              colorFondo: Colors.blue,
              colorTexto: Colors.white,
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: _reportes.length,
        itemBuilder: (context, i) {
          final r = _reportes[i];
          return ReportCard(
            reporte: r,
            onLike: () {},
            onComment: () {},
            onShare: () {},
          );
        },
      ),
    );
  }
}