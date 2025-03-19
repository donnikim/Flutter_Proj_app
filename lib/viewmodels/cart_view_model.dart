import 'package:flutter/material.dart';
import '../models/cart_item.dart';
import '../models/product.dart';

class CartViewModel with ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => _items;

  void addToCart(Product product) {
    final index = _items.indexWhere((item) => item.product.id == product.id);
    if (index >= 0) {
      _items[index].quantity += 1;
    } else {
      _items.add(CartItem(product: product));
    }
    notifyListeners();
  }

  int get totalPrice {
    return _items.fold(0, (sum, item) => sum + (item.product.price * item.quantity));
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }
}
