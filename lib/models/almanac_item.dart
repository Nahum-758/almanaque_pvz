enum ItemType { planta, zombie }

class AlmanacItem {
  final String id;
  final String name;
  final String description;
  final String imageUrl;
  final ItemType type;
  final String stats; // Ej: "Costo: 100 Soles" o "Dureza: Baja"

  AlmanacItem({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.type,
    required this.stats,
  });
}