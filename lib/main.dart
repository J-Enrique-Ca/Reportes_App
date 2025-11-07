import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() {
  runApp(const ReportesApp());
}

class ReportesApp extends StatefulWidget {
  const ReportesApp({super.key});

  @override
  State<ReportesApp> createState() => _ReportesAppState();
}

class _ReportesAppState extends State<ReportesApp> {
  List<dynamic> reportes = [];
  bool cargando = true;

  @override
  void initState() {
    super.initState();
    obtenerReportes();
  }

  Future<void> obtenerReportes() async {
    try {
      final respuesta = await http.get(Uri.parse('http://localhost:8081/reportes'));
      if (respuesta.statusCode == 200) {
        final data = jsonDecode(respuesta.body);
        setState(() {
          reportes = data;
          cargando = false;
        });
      }
    } catch (e) {
      print("❌ Error al conectar con la API: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lista de Reportes',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('📋 Lista de Reportes'),
          backgroundColor: Colors.deepPurple,
        ),
        body: cargando
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                padding: const EdgeInsets.all(10),
                itemCount: reportes.length,
                itemBuilder: (context, index) {
                  final reporte = reportes[index];
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 5,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.deepPurpleAccent,
                        child: Text(
                          reporte['id'].toString(),
                          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                      title: Text(
                        reporte['titulo'],
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      subtitle: Text(
                        '📅 Fecha: ${reporte['fecha']}',
                        style: const TextStyle(fontSize: 14, color: Colors.black54),
                      ),
                      trailing: const Icon(Icons.arrow_forward_ios, color: Colors.deepPurple),
                      onTap: () {
                        
                      },
                    ),
                  );
                },
              ),
      ),
    );
  }
}
