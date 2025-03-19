import 'package:app_kiosk/widgets/main_drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/product_view_model.dart';
import '../widgets/product_item_widget.dart';
import 'product_detail_screen.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final products = context.watch<ProductViewModel>().products;

    return Scaffold(
      appBar: AppBar(title: const Text('모바일 키오스크'),),
      drawer: const MainDrawerWidget(), 
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: products.length,
        itemBuilder: (_, index) => ProductItemWidget(
          product: products[index],
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => ProductDetailScreen(productId: products[index].id),
              ),
            );
          },
        ),
      ),
    );
  }
}
