import 'dart:convert';
import 'package:app/widgets/build_product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  Future<List<Map<String, dynamic>>> loadProducts() async {
    final String response = await rootBundle.loadString('assets/products.json');
    final data = json.decode(response);
    return List<Map<String, dynamic>>.from(data['items'].map((item) => {
      'id': item['id'], 
      'nombre': item['nombre'],
      'costo': item['costo'],
      'descripcion': item['descripcion'],
      'foto': item['foto'],
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: loadProducts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return const Center(child: Text('Error al cargar los productos'));
          }
          final items = snapshot.data!;

          return Column(
            children: [
              BuildProductCard(items: items, height: 350),
              BuildProductCard(items: items, height: 350),
            ],
          );
        },
      ),
    );
  }
}