import 'package:app_kiosk/viewmodels/cart_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'views/product_screen.dart';
import 'viewmodels/product_view_model.dart';

void main() {
  runApp(const KioskApp());
}

class KioskApp extends StatelessWidget {
  const KioskApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      // provider 등록 => MVVM bridge 역할 등록 
      providers: [
        ChangeNotifierProvider(create: (_) => ProductViewModel()),
        ChangeNotifierProvider(create: (_) => CartViewModel()), // 장바구니 추가
      ],
      child: MaterialApp(
        home: const ProductScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
