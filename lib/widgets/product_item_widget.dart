import 'package:app_kiosk/viewmodels/cart_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/product.dart';

class ProductItemWidget extends StatelessWidget {
  final Product product;
  final VoidCallback onTap;

  const ProductItemWidget({super.key, required this.product, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [BoxShadow(
            color: Colors.grey.shade300, 
            blurRadius: 5,
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(
                Icons.image, 
                size: 40, 
                color: Colors.grey,),
            ),
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(product.name, 
                style: const TextStyle(
                  fontSize: 20, 
                  fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text('₩ ${product.price}', 
                  style: const TextStyle(
                    fontSize: 18, 
                    color: Colors.green,
                    ),
                  ),
                const SizedBox(height: 12),
                Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                  icon: const Icon(Icons.favorite_border),
                  color: Colors.red,
                    onPressed: () {
                    Provider.of<CartViewModel>(context, listen: false).addToCart(product);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('${product.name} 장바구니에 담겼습니다')),
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
