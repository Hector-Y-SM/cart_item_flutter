import 'package:app/data/models/product.dart';
import 'package:app/widgets/build_product_card.dart';
import 'package:flutter/material.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  late Future<List<Product>> futureProduct; 
  
  @override
  void initState(){
    super.initState();

    futureProduct = loadProducts();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          BuildProductCard(items: futureProduct, height: 350),
          BuildProductCard(items: futureProduct, height: 350)
        ],
      ),
    );
  }
}