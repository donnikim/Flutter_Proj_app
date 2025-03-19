import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductViewModel with ChangeNotifier {
  final List<Product> _products = List.generate(
    10,
    (index) => Product(
      id: index, 
      name: '상품 ${index + 1}', 
      price: (index + 1) * 1000
    ),
  );

  List<Product> get products => _products;

  Product getProductById(int id) => _products.firstWhere(
    (product) => product.id == id
  );
}
