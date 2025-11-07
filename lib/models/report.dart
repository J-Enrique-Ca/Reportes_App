class Report {
  final String id;
  final String nombreUsuario;
  final String ubicacion;
  final String descripcion;
  final String? imagenUrl;
  final DateTime fecha;

  Report({
    required this.id,
    required this.nombreUsuario,
    required this.ubicacion,
    required this.descripcion,
    this.imagenUrl,
    required this.fecha,
  });

  factory Report.fromJson(Map<String, dynamic> json) {
    return Report(
      id: json['id'].toString(),
      nombreUsuario: json['nombreUsuario'],
      ubicacion: json['ubicacion'],
      descripcion: json['descripcion'],
      imagenUrl: json['imagenUrl'],
      fecha: DateTime.parse(json['fecha']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nombreUsuario': nombreUsuario,
      'ubicacion': ubicacion,
      'descripcion': descripcion,
      'imagenUrl': imagenUrl,
      'fecha': fecha.toIso8601String(),
    };
  }
}