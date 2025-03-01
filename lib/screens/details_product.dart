import 'package:flutter/material.dart';
import 'package:app/screens/products_page.dart';

class DetailsProduct extends StatelessWidget {
  const DetailsProduct({super.key});

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)!.settings.arguments.toString();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalle del Producto'),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: ProductsPage().loadProducts(), 
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return const Center(child: Text('error al cargar los producto'));
          }

          final products = snapshot.data;

          if (products != null) {

            final selectedProduct = products.firstWhere(
              (prod) => prod['id'] == int.parse(productId)
            );
            return selectedProduct.isEmpty
                ? Center(child: Text('Producto no encontrado'))
                : Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(selectedProduct['foto']),
                        SizedBox(height: 16),
                        Text(
                          selectedProduct['nombre'],
                          style: const TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8),
                        Text(
                          '\$${selectedProduct['costo'].toStringAsFixed(2)}',
                          style: const TextStyle(
                              fontSize: 20, color: Colors.green),
                        ),
                        SizedBox(height: 16),
                        Text(
                          selectedProduct['descripcion'],
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  );
          }

          return const Center(child: Text('no hay productos disponibles'));
        },
      ),
    );
  }
}
