import 'dart:convert';
import 'package:flutter/services.dart';

Future<List<Product>> loadProducts() async {
    final String response = await rootBundle.loadString('lib/data/product.json');
    final Map<String, dynamic> data = jsonDecode(response);

    //convertir los datos a una lista 
    List<dynamic> productJson = data["items"];
    List<Product> products = productJson.map((product) => Product.fromJson(product)).toList();
    return products;
  }

class Product {
  int id;
  String nombre;
  double costo;
  String descripcion;
  String foto;

  Product({
    required this.id,
    required this.nombre,
    required this.costo,
    required this.descripcion,
    required this.foto,
  });

  // recibe un json como argumento y retorna un objeto de la clase
  factory Product.fromJson(Map<String, dynamic> json){
    return Product(
      id: json['id'], 
      nombre: json['nombre'],
      costo: json['costo'],
      descripcion: json['descripcion'],
      foto: json['foto'],
      );
  }
}