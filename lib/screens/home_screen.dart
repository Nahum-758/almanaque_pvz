import 'package:flutter/material.dart';
import '../data/pvz_data.dart';
import '../models/almanac_item.dart';
import '../widgets/item_card.dart';
import 'detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String searchFilter = '';
  ItemType? selectedType;

  @override
  Widget build(BuildContext context) {
    final filteredList = pvzDatabase.where((item) {
      final matchesSearch = item.name.toLowerCase().contains(searchFilter.toLowerCase());
      final matchesType = selectedType == null || item.type == selectedType;
      return matchesSearch && matchesType;
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Almanaque PvZ'),
        backgroundColor: Colors.green[800],
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          // Barra de Búsqueda
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              onChanged: (value) => setState(() => searchFilter = value),
              decoration: InputDecoration(
                hintText: 'Buscar entrada...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          // Chips de Filtro
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FilterChip(
                label: const Text('Todos'),
                selected: selectedType == null,
                onSelected: (_) => setState(() => selectedType = null),
              ),
              const SizedBox(width: 8),
              FilterChip(
                label: const Text('Plantas'),
                selected: selectedType == ItemType.planta,
                onSelected: (_) => setState(() => selectedType = ItemType.planta),
              ),
              const SizedBox(width: 8),
              FilterChip(
                label: const Text('Zombies'),
                selected: selectedType == ItemType.zombie,
                onSelected: (_) => setState(() => selectedType = ItemType.zombie),
              ),
            ],
          ),
          const SizedBox(height: 8),
          // Lista Dinámica
          Expanded(
            child: ListView.builder(
              itemCount: filteredList.length,
              itemBuilder: (context, index) {
                final item = filteredList[index];
                return ItemCard(
                  item: item,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailScreen(item: item),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}