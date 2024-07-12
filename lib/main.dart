import 'package:flutter/material.dart';
import 'package:flutter_task/ui/screens/products/products_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: ProductsScreen.routeName,

      routes: {
        ProductsScreen.routeName : (_) => const ProductsScreen()
      },
    );
  }
}
