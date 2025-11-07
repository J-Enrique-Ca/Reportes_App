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
}
