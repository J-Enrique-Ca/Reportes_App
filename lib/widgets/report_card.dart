import 'package:flutter/material.dart';
import '../models/report.dart';
import 'package:intl/intl.dart';

class ReportCard extends StatelessWidget {
  final Report reporte;
  final VoidCallback onLike;
  final VoidCallback onComment;
  final VoidCallback onShare;

  const ReportCard({
    super.key,
    required this.reporte,
    required this.onLike,
    required this.onComment,
    required this.onShare,
  });

  @override
  Widget build(BuildContext context) {
    final fechaFormateada =
        DateFormat('dd/MM/yyyy hh:mm a').format(reporte.fecha);

    return Card(
      margin: const EdgeInsets.all(10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: const CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://cdn-icons-png.flaticon.com/512/1946/1946429.png'),
              ),
              title: Text(reporte.nombreUsuario,
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text('${reporte.ubicacion}\n$fechaFormateada'),
            ),
            const SizedBox(height: 10),
            Text(reporte.descripcion),
            if (reporte.imagenUrl != null) ...[
              const SizedBox(height: 10),
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(reporte.imagenUrl!),
              ),
            ],
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                    icon: const Icon(Icons.thumb_up_alt_outlined),
                    onPressed: onLike),
                IconButton(
                    icon: const Icon(Icons.comment_outlined),
                    onPressed: onComment),
                IconButton(
                    icon: const Icon(Icons.share_outlined), onPressed: onShare),
              ],
            ),
          ],
        ),
      ),
    );
  }
}