import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductViewModel with ChangeNotifier {
final List<Product> _products = [
    Product(id: 1, name: '아메리카노', price: 3000, category: '커피'),
    Product(id: 2, name: '라떼', price: 3500, category: '커피'),
    Product(id: 3, name: '콜라', price: 2000, category: '음료수'),
    Product(id: 4, name: '망고 스무디', price: 4000, category: '스무디'),
    Product(id: 5, name: '마카롱', price: 2500, category: '기타'),
    Product(id: 6, name: '초콜렛', price: 500, category: '기타'),
  ];

  List<Product> get products => _products;

  Product getProductById(int id) => _products.firstWhere(
    (product) => product.id == id
  );

  String _selectedCategory = '전체';
  String get selectedCategory => _selectedCategory;

  void selectCategory(String category) {
  _selectedCategory = category;
  notifyListeners();
  }

  List<Product> get filteredProducts {
  if (_selectedCategory == '전체') return _products;
  return _products.where((p) => p.category == _selectedCategory).toList();
  }



}
