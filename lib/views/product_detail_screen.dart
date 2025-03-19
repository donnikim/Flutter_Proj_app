import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/product_view_model.dart';

class ProductDetailScreen extends StatelessWidget {
  final int productId;

  const ProductDetailScreen({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    final product = context.read<ProductViewModel>().getProductById(productId);

    return Scaffold(
      appBar: AppBar(title: Text(product.name)),
      body: Center(
        child: Text(
          '${product.name} - ₩${product.price}',
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
