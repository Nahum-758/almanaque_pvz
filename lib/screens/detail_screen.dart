import 'package:flutter/material.dart';
import '../models/almanac_item.dart';

class DetailScreen extends StatelessWidget {
  final AlmanacItem item;

  const DetailScreen({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.name),
        backgroundColor: Colors.green[800],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Imagen Destacada con Hero
            Hero(
              tag: item.id,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  item.imageUrl,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    height: 200,
                    color: Colors.grey[300],
                    child: Icon(
                      item.type == ItemType.planta
                          ? Icons.local_florist
                          : Icons.bug_report,
                      size: 80,
                      color: Colors.green[800],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Atributos/Stats
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.info_outline, color: Colors.green),
                const SizedBox(width: 8),
                Text(
                  item.stats,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Descripción detallada
            Text(
              item.description,
              style: const TextStyle(fontSize: 16, height: 1.4),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 30),
            // Botón de Acción
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green[800],
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('${item.name} añadido a marcadores')),
                );
              },
              icon: const Icon(Icons.bookmark_add, color: Colors.white),
              label: const Text(
                'Guardar en Favoritos',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}