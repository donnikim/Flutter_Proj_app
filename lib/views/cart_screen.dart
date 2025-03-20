import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/cart_view_model.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartViewModel>();

    return Scaffold(
      appBar: AppBar(title: const Text('장바구니')),
      body:
          cart.items.isEmpty
              ? const Center(child: Text('장바구니가 비어있습니다.'))
              : Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: cart.items.length,
                      itemBuilder: (context, index) {
                        final item = cart.items[index];
                        return ListTile(
                          title: Text(item.product.name),
                          subtitle: Text(
                            '${item.product.price}원 × ${item.quantity}개',
                          ),
                          trailing: Text(
                            '${item.product.price * item.quantity}원',
                          ),
                        );
                      },
                    ),
                  ),
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('총합', style: TextStyle(fontSize: 18)),
                            Text(
                              '${cart.totalPrice}원',
                              style: const TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {
                                  cart.clearCart();
                                  Navigator.pop(context);
                                },
                                child: const Text('비우기'),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {
                                  // 결제 로직 or 메시지
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('결제가 완료되었습니다'),
                                      duration: Duration(milliseconds: 2000),
                                    ),
                                  );
                                  cart.clearCart();
                                  Navigator.pop(context);
                                },
                                child: const Text('결제하기'),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
    );
  }
}
