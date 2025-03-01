import 'package:app/screens/details_product.dart';
import 'package:app/screens/products_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: ProductsPage(),

      routes: {
                '/product/detail': (context)=> DetailsProduct(),
                '/products': (context) => ProductsPage()
              } //esta cadena solo es una referencia hacia donde ira, puede ser como ser
    );
  }
}
