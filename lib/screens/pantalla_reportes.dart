import 'package:flutter/material.dart';
import '../models/report.dart';
import '../services/report_service.dart';
import '../widgets/report_card.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_input.dart';

class PantallaReportes extends StatefulWidget {
  const PantallaReportes({super.key});

  @override
  State<PantallaReportes> createState() => _PantallaReportesState();
}

class _PantallaReportesState extends State<PantallaReportes> {
  final ReportService _service = ReportService();
  List<Report> _reportes = [];
  bool _cargando = true;

  @override
  void initState() {
    super.initState();
    _cargarReportes();
  }

  Future<void> _cargarReportes() async {
    try {
      final data = await _service.obtenerReportes();
      setState(() {
        _reportes = data;
        _cargando = false;
      });
    } catch (e) {
      print('Error al cargar reportes: $e');
      setState(() => _cargando = false);
    }
  }

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
      body: _cargando
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
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