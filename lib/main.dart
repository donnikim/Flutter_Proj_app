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
      providers: [
        ChangeNotifierProvider(create: (_) => ProductViewModel()),
      ],
      child: MaterialApp(
        home: const ProductScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
