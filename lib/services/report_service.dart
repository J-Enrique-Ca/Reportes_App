import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/report.dart';

class ReportService {
  final String _baseUrl = 'http://localhost:8080'; 

  Future<List<Report>> obtenerReportes() async {
    final url = Uri.parse(_baseUrl);

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((r) => Report.fromJson(r)).toList();
    } else {
      throw Exception('Error al obtener reportes (${response.statusCode})');
    }
  }
}